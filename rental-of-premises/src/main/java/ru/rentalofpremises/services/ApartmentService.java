package ru.rentalofpremises.services;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import ru.rentalofpremises.models.Apartment;
import ru.rentalofpremises.models.User;
import ru.rentalofpremises.repositories.ApartmentRepository;
import ru.rentalofpremises.repositories.UserRepository;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ApartmentService {

    private final ApartmentRepository apartmentRepository;
    private final UserRepository userRepository;

    // ЛИСТ ВСЕХ АПАРТАМЕНТОВ

    public List<Apartment> listApartments(String title){
        if(title != null) return apartmentRepository.findApartmentByTitle(title);
        else return apartmentRepository.findAll();
    }

    // СОХРАНИТЬ / СОЗДАТЬ АПАРТАМЕНТЫ

    public void saveApartment(Principal principal, Apartment apartment) throws IOException {
        apartment.setUser(getUserByPrincipal(principal));
        log.info("saving new {}", apartment);
        apartmentRepository.save(apartment);
    }

    public User getUserByPrincipal(Principal principal) {
        if(principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    // УДАЛИТЬ АПАРТАМЕНТЫ

    public void deleteApartment(Long id) {
        apartmentRepository.deleteById(id);
    }

    // АРЕНДОВАТЬ АПАРТАМЕНТЫ



    // АПАРТАМЕНТЫ ПО ID

    public Apartment getApartmentById(Long id) {
        return apartmentRepository.findById(id).orElse(null);
    }
}

