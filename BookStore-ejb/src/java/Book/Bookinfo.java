/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Book;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author X
 */
@Entity
@Table(name = "BOOKINFO")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Bookinfo.findAll", query = "SELECT b FROM Bookinfo b"),
    @NamedQuery(name = "Bookinfo.findByIsbn", query = "SELECT b FROM Bookinfo b WHERE b.isbn = :isbn"),
    @NamedQuery(name = "Bookinfo.findByTitle", query = "SELECT b FROM Bookinfo b WHERE b.title = :title"),
    @NamedQuery(name = "Bookinfo.findByAuthor", query = "SELECT b FROM Bookinfo b WHERE b.author = :author"),
    @NamedQuery(name = "Bookinfo.findByPrice", query = "SELECT b FROM Bookinfo b WHERE b.price = :price"),
    @NamedQuery(name = "Bookinfo.findByPress", query = "SELECT b FROM Bookinfo b WHERE b.press = :press"),
    @NamedQuery(name = "Bookinfo.findByHref", query = "SELECT b FROM Bookinfo b WHERE b.href = :href"),
    @NamedQuery(name = "Bookinfo.SearchByTitle", query = "SELECT b FROM Bookinfo b WHERE b.title like :title")})
public class Bookinfo implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ISBN")
    private Integer isbn;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "TITLE")
    private String title;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 64)
    @Column(name = "AUTHOR")
    private String author;
    @Basic(optional = false)
    @NotNull
    @Column(name = "PRICE")
    private int price;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "PRESS")
    private String press;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "HREF")
    private String href;

    public Bookinfo() {
    }

    public Bookinfo(Integer isbn) {
        this.isbn = isbn;
    }

    public Bookinfo(Integer isbn, String title, String author, int price, String press, String href) {
        this.isbn = isbn;
        this.title = title;
        this.author = author;
        this.price = price;
        this.press = press;
        this.href = href;
    }

    public Long getIsbn() {
        return isbn.longValue();
    }

    public void setIsbn(Integer isbn) {
        this.isbn = isbn;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (isbn != null ? isbn.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Bookinfo)) {
            return false;
        }
        Bookinfo other = (Bookinfo) object;
        if ((this.isbn == null && other.isbn != null) || (this.isbn != null && !this.isbn.equals(other.isbn))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Book.Bookinfo[ isbn=" + isbn + " ]";
    }
    
}
