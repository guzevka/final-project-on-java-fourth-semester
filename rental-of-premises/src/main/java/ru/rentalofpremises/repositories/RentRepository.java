package ru.rentalofpremises.repositories;

import jakarta.websocket.server.PathParam;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import ru.rentalofpremises.models.Rent;
import ru.rentalofpremises.models.User;

import java.util.Optional;

public interface RentRepository extends JpaRepository<Rent, Long> {

    Optional<Rent> findById(@PathParam("id") Long id);

    Iterable<Rent> findAllByUser(User user);

    @Query(
            value = "SELECT r.sum FROM Rent r WHERE r.id=?1"
    )
    double getSum(Long id);
}
