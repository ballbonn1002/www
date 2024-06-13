package com.cubesofttech.model;

import java.io.Serializable;

import javax.persistence.Column;
/*
 *  User for Multiple Primary Key Table Only
 */
public class ArticleRelatedPK implements Serializable {
	
	/** Creates a new instance of UserRole */
    public ArticleRelatedPK(
            String articleId	
            , String relatedArticleId	
        ) {
        this.articleId = articleId;	
        this.relatedArticleId = relatedArticleId;	
    }
    
    public ArticleRelatedPK(){
    	
    }
    @Column(name = "article_id")
    private String articleId;	
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
        return super.toString() + " " + articleId + " " + relatedArticleId;
    }
    
	public int hashCode()
	{
		return (int) Math.random();
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
