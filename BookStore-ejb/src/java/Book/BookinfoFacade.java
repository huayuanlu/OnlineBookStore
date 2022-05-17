/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Book;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author X
 */
@Stateless
public class BookinfoFacade extends AbstractFacade<Bookinfo> implements BookinfoFacadeLocal {
    @PersistenceContext(unitName = "BookStore-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
    public BookinfoFacade() {
        super(Bookinfo.class);
    }
    
    @Override
    public List<Bookinfo> findByTitle(Object title){	
        return em.createNamedQuery("Bookinfo.findByTitle").setParameter("title", title).getResultList();
    }
    
    @Override
    public Object findByISBN(Object Isbn){	
        return em.createNamedQuery("Bookinfo.findByIsbn").setParameter("isbn", Isbn ).getSingleResult();
    }
    
    @Override
    public List<Bookinfo> SearchByTitle(Object title){	
        return em.createNamedQuery("Bookinfo.SearchByTitle").setParameter("title", "%" + title + "%").getResultList();
    }
}
