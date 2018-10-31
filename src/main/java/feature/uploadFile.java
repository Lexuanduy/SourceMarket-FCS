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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*response.getWriter().append("Served at: ").append(request.getContextPath());*/
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/jsps/uploadFile.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		log.warning("upload sound");
		Enumeration<String> paramNames = request.getParameterNames();
		while (paramNames.hasMoreElements()) {
			String paramName = (String) paramNames.nextElement();
			log.warning(paramName);
			String param = request.getParameter(paramName);
			log.warning(param);
		}
		long now = 0;
		String file = null;
		String avatar = null;
		String imgDescription = null;
		List<Part> fileParts = request.getParts().stream().filter(part -> "file".equals(part.getName()))
				.collect(Collectors.toList()); // Retrieves <input type="file" name="file" multiple="true">
		for (Part filePart : fileParts) {
			try {
				log.warning("co file moi");
				String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
				InputStream fileContent = filePart.getInputStream();

				byte[] buffer = new byte[fileContent.available()];
				fileContent.read(buffer);

				GcsOutputChannel outputChannel;
				now = System.currentTimeMillis();
				now = now / 1000;
				file = Long.toString(now, Character.MAX_RADIX);
				GcsFilename fileName2 = new GcsFilename("sourcemarket-220904.appspot.com","file/" + file + ".rar");
				log.warning(fileName2.getBucketName());
				GcsFileMetadata metadata = gcsService.getMetadata(fileName2);

				byte[] audioByte = buffer;
				ByteBuffer buf = ByteBuffer.wrap(audioByte);
				GcsFileOptions options = new GcsFileOptions.Builder().acl("public-read").build();
				outputChannel = gcsService.createOrReplace(fileName2, options);

				outputChannel.write(buf);
				
				log.warning("save file success");
				log.warning("close");
				outputChannel.close();

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			response.getWriter().println(file);
		}

		List<Part> fileAvatar = request.getParts().stream().filter(part -> "avatar".equals(part.getName()))
				.collect(Collectors.toList());
		for (Part filePart : fileAvatar) {
			try {
				log.warning("co file moi");
				String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
				InputStream fileContent = filePart.getInputStream();

				byte[] buffer = new byte[fileContent.available()];
				fileContent.read(buffer);

				GcsOutputChannel outputChannel;
				now = System.currentTimeMillis();
				now = now / 100;
				avatar = Long.toString(now, Character.MAX_RADIX);
				GcsFilename fileName2 = new GcsFilename("sourcemarket-220904.appspot.com","avatar/" + avatar + ".png");
				log.warning(fileName2.getBucketName());
				GcsFileMetadata metadata = gcsService.getMetadata(fileName2);

				byte[] audioByte = buffer;
				ByteBuffer buf = ByteBuffer.wrap(audioByte);
				GcsFileOptions options = new GcsFileOptions.Builder().acl("public-read").build();
				outputChannel = gcsService.createOrReplace(fileName2, options);

				outputChannel.write(buf);
				log.warning("save file avatar success");
				log.warning("close");
				outputChannel.close();

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			response.getWriter().println(avatar);
		}

		List<Part> fileImgDescription = request.getParts().stream().filter(part -> "imgDescription".equals(part.getName()))
				.collect(Collectors.toList());
		for (Part filePart : fileImgDescription) {
			try {
				log.warning("co file moi");
				String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
				InputStream fileContent = filePart.getInputStream();

				byte[] buffer = new byte[fileContent.available()];
				fileContent.read(buffer);

				GcsOutputChannel outputChannel;
				now = System.currentTimeMillis();
				imgDescription = Long.toString(now, Character.MAX_RADIX);
				GcsFilename fileName2 = new GcsFilename("sourcemarket-220904.appspot.com","imgDescription/" + imgDescription + ".png");
				log.warning(fileName2.getBucketName());
				GcsFileMetadata metadata = gcsService.getMetadata(fileName2);

				byte[] audioByte = buffer;
				ByteBuffer buf = ByteBuffer.wrap(audioByte);
				GcsFileOptions options = new GcsFileOptions.Builder().acl("public-read").build();
				outputChannel = gcsService.createOrReplace(fileName2, options);

				outputChannel.write(buf);
				String nameFile = request.getParameter("name");
				String descriptionFile = request.getParameter("description");
				String pointFile = request.getParameter("point");
				String linkDemoFile = request.getParameter("linkDemo");
				String linkFile = request.getParameter("linkSource");
				File fileSource = new File("f003" ,nameFile,"K001","C002",descriptionFile, pointFile, linkDemoFile, linkFile, "link avatar", "link img");
				ofy().save().entity(fileSource).now();
				outputChannel.close();

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			response.getWriter().println(imgDescription);
			return;
		}
	}

}
