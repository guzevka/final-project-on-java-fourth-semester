package ru.rentalofpremises.services;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.rentalofpremises.models.Rent;
import ru.rentalofpremises.models.User;
import ru.rentalofpremises.repositories.RentRepository;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class RentService {
    private final RentRepository rentRepository;

    public List<Rent> findAll(){
        return rentRepository.findAll();
    }

    public List<Rent> findAllByUser(User user) {
        return (List<Rent>) rentRepository.findAllByUser(user);
    }

    public Rent findById(Long id){
        return rentRepository.findById(id).orElse(null);
    }

    public void delete(Long id){
        rentRepository.deleteById(id);
    }

    @Transactional
    public void save(Rent rent){
        double sum = rent.getApartment().getPrice() * rent.getDays();
        rent.setSum(sum);
        System.out.println(sum);
        rentRepository.save(rent);
    }

}
