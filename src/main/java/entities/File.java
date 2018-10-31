package entities;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

@Entity
public class File {
	@Id
	private String id;
	@Index
	private String name;
	private String kindId;
	private String categoryId;
	private String description;
	private String point;
	private String linkDemo;
	private String linkSource;
	private String avatar;
	private String images;

	public File() {
		super();
	}

	public File(String id, String name, String kindId, String categoryId, String description, String point,
			String linkDemo, String linkSource, String avatar, String images) {
		super();
		this.id = id;
		this.name = name;
		this.kindId = kindId;
		this.categoryId = categoryId;
		this.description = description;
		this.point = point;
		this.linkDemo = linkDemo;
		this.linkSource = linkSource;
		this.avatar = avatar;
		this.images = images;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getKindId() {
		return kindId;
	}

	public void setKindId(String kindId) {
		this.kindId = kindId;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
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

	public String getLinkSource() {
		return linkSource;
	}

	public void setLinkSource(String linkSource) {
		this.linkSource = linkSource;
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
