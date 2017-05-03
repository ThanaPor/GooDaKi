create table if not exists "Subject" (
    subjectID       serial,
    name            varchar(255),
    description     text,
    created_at      timestamp,
    updated_at      timestamp,
    authorID        int,
    primary key (subjectID)
);

create table if not exists "Course" (
    courseID        serial,
    name            varchar(255),
    description     text,
    created_at      timestamp,
    updated_at      timestamp,
    authorID        int,
    primary key (courseID)
);

create table if not exists "CareerPath" (
    careerID        serial,
    name            varchar(255),
    description     text,
    created_at      timestamp,
    updated_at      timestamp,
    authorID        int,
    primary key (careerID)
);

create table if not exists "ChunkInSubject" (
    chunkID         int,
    subjectID       int,
    primary key (chunkID, subjectID),
    foreign key (subjectID) references "Subject"
);

create table if not exists "SubjectInCourse" (
    subjectID       int,
    courseID        int,
    primary key (subjectID, courseID),
    foreign key (subjectID) references "Subject"(subjectID),
    foreign key (courseID) references "Course"(courseID)
);

create table if not exists "CourseInCareerPath" (
    courseID        int,
    careerID        int,
    primary key (courseID, careerID),
    foreign key (courseID) references "Course"(courseID),
    foreign key (careerID) references "CareerPath"(careerID)
);

-- TODO: table for tags