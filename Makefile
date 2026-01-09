all: up

up:
	cd srcs && docker-compose up -d --build

down:
	cd srcs && docker-compose down

test-mariadb:
	docker exec -it mariadb mysql -u$(MYSQL_USER) -p$(MYSQL_PASSWORD) $(MYSQL_DATABASE)

clean:
	cd srcs && docker-compose down -v

.PHONY: all up down test-mariadb clean
