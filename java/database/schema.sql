BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;

CREATE TABLE organization (
    organization_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    organization_name VARCHAR(100) NOT NULL UNIQUE,
    organization_username VARCHAR(100) NOT NULL,
    organization_password_hash VARCHAR(200) NOT NULL,
    organization_role VARCHAR(15)
);

CREATE TABLE users (
	user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	organization_id UUID REFERENCE organization(organization_id),
	department VARCHAR(25) NOT NULL,
	email VARCHAR(75) NOT NULL UNIQUE,
	username VARCHAR(50) NOT NULL UNIQUE,
	password_hash VARCHAR(200) NOT NULL,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(25) NOT NULL,
	role VARCHAR(15) NOT NULL
);

CREATE TABLE schedule (
    schedule_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCE users(user_id),
    day_of_week VARCHAR(15) NOT NULL,
    scheduled_start_time TIMESTAMP,
    scheduled_stop_time TIMESTAMP
);

CREATE TABLE worked (
    worked_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCE users(user_id),
    day_of_week VARCHAR(15) NOT NULL,
    actual_start_time TIMESTAMP,
    actual_stop_time TIMESTAMP
);

CREATE TABLE user_availability (
    availability_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(user_id),
    day_of_week VARCHAR(15) NOT NULL,
    available_start_time TIMESTAMP,
    available_stop_time TIMESTAMP
);

CREATE TABLE shift_offer (
    offer_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    offering_user_id UUID REFERENCES users(user_id),
    accepting_user_id UUID REFERENCES users(user_id),
    offered_start_time TIMESTAMP,
    offered_stop_time TIMESTAMP,
    accepted BOOLEAN DEFAULT FALSE
);


COMMIT TRANSACTION;
