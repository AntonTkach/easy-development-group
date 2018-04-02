package com.edg.SpringServer;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import java.util.Collection;
import java.util.stream.Stream;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.annotation.Id;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.data.rest.core.annotation.RestResource;
import org.springframework.stereotype.Component;

@SpringBootApplication
public class SpringServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringServerApplication.class, args);
	}
}
@Entity
class Reservation {
    @Id
    @GeneratedValue
    private Long id;
    private String reservationName;
    public Long getId() {
        return id;
    }
    public String getReservationName() {
        return reservationName;
    }
    public Reservation(String reservationName) {
        this.reservationName = reservationName;
    }
    public Reservation() {
    }
    @Override
    public String toString() {
        return "Reservation{" + "id=" + id + ", reservationName=" + reservationName + '}';
    }
}
@RepositoryRestResource
interface ReservationRepository extends JpaRepository {
    @RestResource(path = "by-name")
    Collection findByReservationName(@Param("rn") String rn);
}
@Component
class DummyCLR implements CommandLineRunner {
    @Autowired
    private ReservationRepository repository;
    @Override
    public void run(String... args) throws Exception {
        Stream.of("Josh", "Geertjan", "Pieter").forEach(x -> 
           repository.save(new Reservation(x)));
        repository.findAll().forEach(System.out::println);
    }
}
