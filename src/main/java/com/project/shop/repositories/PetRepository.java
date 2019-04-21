package com.project.shop.repositories;

import com.project.shop.models.Accessory;
import com.project.shop.models.Pet;
import com.project.shop.models.SearchForm;
import com.project.shop.models.Type;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PetRepository extends JpaRepository<Pet, Long>
{
        @Query ("select p from Pet p where " +
                "(" +
                ":phrase is null OR :phrase = '' OR " +
                "lower(p.name) = lower(:phrase)" +
                ") " +
                "AND " +
                "(:minPrice is null OR :minPrice <= p.price) " +
                "AND (:maxPrice is null OR :maxPrice >= p.price)" +
                "AND (p.sold = false )" +
                "AND (p.deleted = false)")
        Page<Pet> findByFilter ( @Param ("phrase") String phrase,
                                 @Param ("maxPrice") Float maxPrice,
                                 @Param ("minPrice") Float minPrice,
                                 Pageable pageable );

        Page<Pet> findAllByType ( Type type, Pageable pageable );

}
