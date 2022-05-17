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
    @NamedQuery(name = "Bookinfo.SearchByTitle", query = "SELECT b FROM Bookinfo b WHERE b.title like :title")})
public class Bookinfo implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ISBN")
    private Long isbn;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 64)
    @Column(name = "TITLE")
    private String title;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 32)
    @Column(name = "AUTHOR")
    private String author;
    @Basic(optional = false)
    @NotNull
    @Column(name = "PRICE")
    private double price;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 32)
    @Column(name = "PRESS")
    private String press;

    public Bookinfo() {
    }

    public Bookinfo(Long isbn) {
        this.isbn = isbn;
    }

    public Bookinfo(Long isbn, String title, String author, double price, String press) {
        this.isbn = isbn;
        this.title = title;
        this.author = author;
        this.price = price;
        this.press = press;
    }

    public Long getIsbn() {
        return isbn;
    }

    public void setIsbn(Long isbn) {
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
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
