package org.isetn;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.isetn.entities.*;
import org.isetn.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;

@SpringBootApplication
public class ScolA7Application implements CommandLineRunner {
	@Autowired
	private FormationRepository formationRepository;

	@Autowired
	private ClasseRepository classeRepository;

	@Autowired
	private EtudiantRepository etudiantRepository;

	@Autowired
	private DepartementRepository departementRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private RepositoryRestConfiguration repositoryRestConfiguration;
	public static void main(String[] args) {
		SpringApplication.run(ScolA7Application.class, args);
	}

	@Override
	public void run(String... args) throws Exception {

		Formation f1 = formationRepository.save(new Formation(null,"Oracle",100,null));
		Formation f2 = formationRepository.save(new Formation(null,"J2EE",10,null));
		Formation f3 = formationRepository.save(new Formation(null,"Angular",120,null));
		Departement d1 = departementRepository.save(new Departement(null, "TI", null));
		Departement d2 = departementRepository.save(new Departement(null, "Genie civil", null));
		Departement d3 = departementRepository.save(new Departement(null, "Genie electrique", null));

		Classe c1 = classeRepository.save(new Classe(null,"DSI31",27,null, d1));
		Classe c2 = classeRepository.save(new Classe(null,"DSI32",25,null, d1));
		Classe c3 = classeRepository.save(new Classe(null,"DSI33",20,null, d1));

		Classe c4 = classeRepository.save(new Classe(null,"GC31",27,null, d2));
		Classe c5 = classeRepository.save(new Classe(null,"GC32",25,null, d2));
		Classe c6 = classeRepository.save(new Classe(null,"GC33",20,null, d2));

		Classe c7 = classeRepository.save(new Classe(null,"GE31",27,null, d2));
		Classe c8 = classeRepository.save(new Classe(null,"GE32",25,null, d2));
		Classe c9 = classeRepository.save(new Classe(null,"GE33",20,null, d2));
		User u1 = userRepository.save(new User(null,"admin@gmail.com","admin"));


		SimpleDateFormat fdate = new SimpleDateFormat("dd-MM-yyyy");


		etudiantRepository.save(new Etudiant(null, "Ali", "Ben Ali", fdate.parse("10-03-2021"),f1,c1));
		etudiantRepository.save(new Etudiant(null, "Mohamed", "Ben Mohamed", fdate.parse("1-04-2010"),f1,c1));
		etudiantRepository.save(new Etudiant(null, "Amin", "Ben Mahmoud", fdate.parse("19-07-2015"),f2,c1));
		etudiantRepository.save(new Etudiant(null, "Samia", "Ben Ahmed", fdate.parse("26-10-2014"),f3,c1));
		etudiantRepository.save(new Etudiant(null, "Foulen", "Ben Foulen1", fdate.parse("11-02-2018"),f3,c2));
		etudiantRepository.save(new Etudiant(null, "Foulen", "Ben Foulen2", new Date(),f3,c3));

		etudiantRepository.save(new Etudiant(null, "Ali", "Ben Ali", fdate.parse("10-03-2021"),f1,c4));
		etudiantRepository.save(new Etudiant(null, "Mohamed", "Ben Mohamed", fdate.parse("1-04-2010"),f1,c4));
		etudiantRepository.save(new Etudiant(null, "Amin", "Ben Mahmoud", fdate.parse("19-07-2015"),f2,c4));
		etudiantRepository.save(new Etudiant(null, "Samia", "Ben Ahmed", fdate.parse("26-10-2014"),f3,c4));
		etudiantRepository.save(new Etudiant(null, "Foulen", "Ben Foulen1", fdate.parse("11-02-2018"),f3,c5));
		etudiantRepository.save(new Etudiant(null, "Foulen", "Ben Foulen2", new Date(),f3,c6));


		etudiantRepository.save(new Etudiant(null, "Ali", "Ben Ali", fdate.parse("10-03-2021"),f1,c7));
		etudiantRepository.save(new Etudiant(null, "Mohamed", "Ben Mohamed", fdate.parse("1-04-2010"),f1,c7));
		etudiantRepository.save(new Etudiant(null, "Amin", "Ben Mahmoud", fdate.parse("19-07-2015"),f2,c7));
		etudiantRepository.save(new Etudiant(null, "Samia", "Ben Ahmed", fdate.parse("26-10-2014"),f3,c7));
		etudiantRepository.save(new Etudiant(null, "Foulen", "Ben Foulen1", fdate.parse("11-02-2018"),f3,c8));
		etudiantRepository.save(new Etudiant(null, "Foulen", "Ben Foulen2", new Date(),f3,c9));
	}
}
