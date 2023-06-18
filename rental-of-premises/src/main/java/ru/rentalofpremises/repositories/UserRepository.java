package ru.rentalofpremises.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.rentalofpremises.models.User;
public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);
}
