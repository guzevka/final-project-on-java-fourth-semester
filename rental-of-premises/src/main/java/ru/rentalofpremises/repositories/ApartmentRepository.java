package ru.rentalofpremises.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.rentalofpremises.models.Apartment;

import java.util.List;

public interface ApartmentRepository extends JpaRepository<Apartment, Long> {

    List<Apartment> findApartmentByTitle(String title);

}
