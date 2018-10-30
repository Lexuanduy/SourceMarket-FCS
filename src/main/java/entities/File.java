package entities;

import com.googlecode.objectify.Ref;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Load;
import com.googlecode.objectify.annotation.Parent;

@Entity
public class File {
	@Id
	private String id;
	@Load
	@Parent
	private Ref<Category> category;
	@Load
	@Parent
	private Ref<Kind> kind;
	private String description;
	private String point;
	private String linkDemo;
	private String avatar;
	private String images;

	public File() {
		super();
	}

	public File(String id, Ref<Category> category, Ref<Kind> kind, String description, String point,
			String linkDemo, String avatar, String images) {
		super();
		this.id = id;
		this.category = category;
		this.kind = kind;
		this.description = description;
		this.point = point;
		this.linkDemo = linkDemo;
		this.avatar = avatar;
		this.images = images;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Ref<Category> getCategory() {
		return category;
	}

	public void setCategory(Ref<Category> category) {
		this.category = category;
	}

	public Ref<Kind> getKind() {
		return kind;
	}

	public void setKind(Ref<Kind> kind) {
		this.kind = kind;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}

	public String getLinkDemo() {
		return linkDemo;
	}

	public void setLinkDemo(String linkDemo) {
		this.linkDemo = linkDemo;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	
}
