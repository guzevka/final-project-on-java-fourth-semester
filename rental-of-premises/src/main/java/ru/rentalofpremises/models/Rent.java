package ru.rentalofpremises.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "rents1")
public class Rent {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "\"user\"")
    private User user;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "apartment")
    private Apartment apartment;

    @Column(name = "start_date")
    private LocalDate start_date;

    @Column(name = "days")
    private int days;

    @Column(name = "end_date")
    private LocalDate end_date;

    @Column(name = "sum")
    private double sum;

}
