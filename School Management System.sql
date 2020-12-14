CREATE TABLE public.school(
	branch_id SERIAL PRIMARY KEY,
	branch_name VARCHAR(256) NOT NULL,
	branch_address VARCHAR(256) NOT NULL,
	branch_ph INTEGER NOT NULL
);

CREATE TABLE public.students(
	student_id SERIAL PRIMARY KEY,
	student_first_name VARCHAR(256) NOT NULL,
	student_last_name VARCHAR(256) NULL,
	student_phone_number INTEGER UNIQUE,
	student_email_address VARCHAR(256) UNIQUE NOT NULL
);

CREATE TABLE public.course_reg(
	course_id INT PRIMARY KEY,
	course_name VARCHAR(256) NOT NULL,
	course_date DATE NOT NULL,
	student_id INT NOT NULL,
	CONSTRAINT student_id FOREIGN KEY(student_id) REFERENCES public.students(student_id)
);

CREATE TABLE public.teacher(
	teacher_id SERIAL PRIMARY KEY,
	teacher_name VARCHAR(256) NOT NULL,
	teacher_email_address VARCHAR(256) NOT NULL,
	teacher_phone_number INT NOT NULL
);

CREATE TABLE public.room(
	room_id SERIAL PRIMARY KEY
);

CREATE TABLE public.class(
	class_id INT PRIMARY KEY,
	class_name VARCHAR(256) NOT NULL,
	student_id INT NOT NULL,
	teacher_id INT NOT NULL,
	course_id INT NOT NULL,
	room_id INT NOT NULL,
	class_date DATE NOT NULL,
	class_start_time time NOT NULL,
	class_end_time time NOT NULL,
	CONSTRAINT student_id FOREIGN KEY(student_id) REFERENCES public.students(student_id),
	CONSTRAINT course_id FOREIGN KEY(course_id) REFERENCES public.course_reg(course_id),
	CONSTRAINT teacher_id FOREIGN KEY(teacher_id) REFERENCES public.teacher(teacher_id),
	CONSTRAINT room_id FOREIGN KEY(room_id) REFERENCES public.room(room_id)
);

CREATE TABLE public.paper(
	paper_id SERIAL PRIMARY KEY,
	student_id INT NOT NULL,
	teacher_id INT NOT NULL,
	course_id INT NOT NULL,
	paper_date DATE NOT NULL,
	paper_start_time TIME NOT NULL,
	total_marks INT NOT NULL,
	CONSTRAINT student_id FOREIGN KEY(student_id) REFERENCES public.students(student_id),
	CONSTRAINT teacher_id FOREIGN KEY(teacher_id) REFERENCES public.teacher(teacher_id),
	CONSTRAINT course_id FOREIGN KEY(course_id) REFERENCES public.course_reg(course_id)
);

