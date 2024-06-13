package com.cubesofttech.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "article_related")
@IdClass(ArticleRelatedPK.class)
@NamedQueries({ 
	@NamedQuery(name = "ArticleRelated.findAll", query = "SELECT t FROM ArticleRelated t") })
public class ArticleRelated implements Serializable {
	
	public ArticleRelated() {
	}
	
	public ArticleRelated(String articleId, String relatedArticleId) {
		this.articleId = articleId;
		this.relatedArticleId = relatedArticleId;
	}

	@Id
	@Column(name = "article_id")
    private String articleId;	
	@Id
    @Column(name = "related_article_id")
    private String relatedArticleId;
    
	public String getArticleId() {
		return articleId;
	}
	public void setArticleId(String articleId) {
		this.articleId = articleId;
	}
	public String getRelatedArticleId() {
		return relatedArticleId;
	}
	public void setRelatedArticleId(String relatedArticleId) {
		this.relatedArticleId = relatedArticleId;
	}	
	
	public String toString() {
        return super.toString() + "articleId=[" + articleId + "]\n" + "relatedArticleId=[" + relatedArticleId + "]\n";
    }

    public boolean equals(Object obj) {
        if (this == obj) {
                return true;
        }
        if (!(obj instanceof ArticleRelated)) {
                return false;
        }
        ArticleRelated that = (ArticleRelated) obj;
        if (!(that.getArticleId() == null ? this.getArticleId() == null
                        : that.getArticleId().equals(this.getArticleId()))) {
                return false;
        }
        if (!(that.getRelatedArticleId() == null ? this.getRelatedArticleId() == null
                        : that.getRelatedArticleId().equals(this.getRelatedArticleId()))) {
                return false;
        }
    return true;
    }
    
}
