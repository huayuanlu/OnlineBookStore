/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Order;

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
@Table(name = "ORDERLIST")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Orderlist.findAll", query = "SELECT o FROM Orderlist o"),
    @NamedQuery(name = "Orderlist.findByOrderid", query = "SELECT o FROM Orderlist o WHERE o.orderid = :orderid"),
    @NamedQuery(name = "Orderlist.findByIsbn", query = "SELECT o FROM Orderlist o WHERE o.isbn = :isbn"),
    @NamedQuery(name = "Orderlist.findByTitle", query = "SELECT o FROM Orderlist o WHERE o.title = :title"),
    @NamedQuery(name = "Orderlist.findByUsername", query = "SELECT o FROM Orderlist o WHERE o.username = :username"),
    @NamedQuery(name = "Orderlist.findByCartnum", query = "SELECT o FROM Orderlist o WHERE o.cartnum = :cartnum"),
    @NamedQuery(name = "Orderlist.findByCost", query = "SELECT o FROM Orderlist o WHERE o.cost = :cost"),
    @NamedQuery(name = "Orderlist.findByTime", query = "SELECT o FROM Orderlist o WHERE o.time = :time")})
public class Orderlist implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ORDERID")
    private Integer orderid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ISBN")
    private int isbn;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "TITLE")
    private String title;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 64)
    @Column(name = "USERNAME")
    private String username;
    @Basic(optional = false)
    @NotNull
    @Column(name = "CARTNUM")
    private int cartnum;
    @Basic(optional = false)
    @NotNull
    @Column(name = "COST")
    private int cost;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 64)
    @Column(name = "TIME")
    private String time;

    public Orderlist() {
    }

    public Orderlist(Integer orderid) {
        this.orderid = orderid;
    }

    public Orderlist(Integer orderid, int isbn, String title, String username, int cartnum, int cost, String time) {
        this.orderid = orderid;
        this.isbn = isbn;
        this.title = title;
        this.username = username;
        this.cartnum = cartnum;
        this.cost = cost;
        this.time = time;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public int getIsbn() {
        return isbn;
    }

    public void setIsbn(int isbn) {
        this.isbn = isbn;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getCartnum() {
        return cartnum;
    }

    public void setCartnum(int cartnum) {
        this.cartnum = cartnum;
    }

    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderid != null ? orderid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Orderlist)) {
            return false;
        }
        Orderlist other = (Orderlist) object;
        if ((this.orderid == null && other.orderid != null) || (this.orderid != null && !this.orderid.equals(other.orderid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Order.Orderlist[ orderid=" + orderid + " ]";
    }
    
}
