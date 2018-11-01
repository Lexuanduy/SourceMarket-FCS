package feature;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.file.Paths;
import java.util.Enumeration;
import java.util.List;
import java.util.logging.Logger;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.appengine.tools.cloudstorage.GcsFileMetadata;
import com.google.appengine.tools.cloudstorage.GcsFileOptions;
import com.google.appengine.tools.cloudstorage.GcsFilename;
import com.google.appengine.tools.cloudstorage.GcsOutputChannel;
import com.google.appengine.tools.cloudstorage.GcsService;
import com.google.appengine.tools.cloudstorage.GcsServiceFactory;
import com.googlecode.objectify.ObjectifyService;

import entities.Category;
import entities.File;
import entities.Kind;

/**
 * Servlet implementation class uploadFile
 */
@WebServlet("/uploadFile")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class uploadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static {
		ObjectifyService.register(Category.class);
		ObjectifyService.register(Kind.class);
		ObjectifyService.register(File.class);
	};

	GcsService gcsService = GcsServiceFactory.createGcsService();
	static Logger log = Logger.getLogger(uploadFile.class.getName());

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public uploadFile() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*
		 * response.getWriter().append("Served at: ").append(request.getContextPath());
		 */
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/jsps/uploadFile.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Enumeration<String> paramNames = request.getParameterNames();
		while (paramNames.hasMoreElements()) {
			String paramName = (String) paramNames.nextElement();
			String param = request.getParameter(paramName);
			log.warning(param);
		}

		long now = 0;
		String file = null;
		String avatar = null;
		String imgDescription = null;

		Part fileSource = request.getPart("file");
		Part avatarPart = request.getPart("avatar");
		Part imgPart = request.getPart("imgDescription");
		log.warning("" + imgPart);
		try {
			log.warning("co file moi");
			String fileNameSource = Paths.get(fileSource.getSubmittedFileName()).getFileName().toString();
			String fileName_Avatar = Paths.get(avatarPart.getSubmittedFileName()).getFileName().toString();
			String fileName_Img = Paths.get(imgPart.getSubmittedFileName()).getFileName().toString();

			InputStream fileContentFile = fileSource.getInputStream();
			InputStream fileContentAvatar = avatarPart.getInputStream();
			InputStream fileContentImg = imgPart.getInputStream();

			byte[] bufferFile = new byte[fileContentFile.available()];
			byte[] bufferAvatar = new byte[fileContentAvatar.available()];
			byte[] bufferImg = new byte[fileContentImg.available()];

			fileContentFile.read(bufferFile);
			fileContentAvatar.read(bufferAvatar);
			fileContentImg.read(bufferImg);

			GcsOutputChannel outputChannelFile;
			GcsOutputChannel outputChannelAvatar;
			GcsOutputChannel outputChannelImg;

			now = System.currentTimeMillis();
			now = now / 1000;
			file = Long.toString(now, Character.MAX_RADIX);
			now = now * 1000;
			avatar = Long.toString(now, Character.MAX_RADIX);
			now = now / 100;
			imgDescription = Long.toString(now, Character.MAX_RADIX);

			GcsFilename fileNameFile = new GcsFilename("sourcemarket-220904.appspot.com", "file/" + file + ".rar");
			GcsFilename fileNameAvatar = new GcsFilename("sourcemarket-220904.appspot.com", "avatar/" + avatar + ".png");
			GcsFilename fileNameImg = new GcsFilename("sourcemarket-220904.appspot.com", "imgDescription/" + imgDescription + ".png");
			log.warning("" + fileNameImg.getBucketName());
			

			byte[] FileByte = bufferFile;
			byte[] AvatarByte = bufferAvatar;
			byte[] ImgByte = bufferImg;

			ByteBuffer bufFile = ByteBuffer.wrap(FileByte);
			ByteBuffer bufAvatar = ByteBuffer.wrap(AvatarByte);
			ByteBuffer bufImg = ByteBuffer.wrap(ImgByte);

			GcsFileOptions options = new GcsFileOptions.Builder().acl("public-read").build();

			outputChannelFile = gcsService.createOrReplace(fileNameFile, options);
			outputChannelAvatar = gcsService.createOrReplace(fileNameAvatar, options);
			outputChannelImg = gcsService.createOrReplace(fileNameImg, options);

			outputChannelFile.write(bufFile);
			outputChannelAvatar.write(bufAvatar);
			outputChannelImg.write(bufImg);

			String nameFile = request.getParameter("name");
			String kindId = request.getParameter("kindId");
			String categoryId = request.getParameter("categoryId");
			String descriptionFile = request.getParameter("description");
			String pointFile = request.getParameter("point");
			String linkDemoFile = request.getParameter("linkDemo");
			String linkFile = request.getParameter("linkSource");
			File fileSourceCode = new File(file, nameFile, kindId, categoryId, descriptionFile, pointFile, linkDemoFile,
					linkFile, avatar, imgDescription);
			ofy().save().entity(fileSourceCode).now();
			
			outputChannelFile.close();
			outputChannelAvatar.close();
			outputChannelImg.close();
			log.warning("close");
		} catch (Exception e) {
			// TODO: handle exception
			log.warning("error");
			e.printStackTrace();
		}
		response.getWriter().println(file);
		response.getWriter().println(avatar);
		response.getWriter().println(imgDescription);
		log.warning("save file success return response!!!");
	}

}
