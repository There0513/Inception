
all:		
			@sudo mkdir -p /home/threiss/data
			@sudo mkdir -p /home/threiss/data/mariadb
			@sudo chmod 777 /home/threiss/data/mariadb
			@sudo mkdir -p /home/threiss/data/wordpress
			@sudo chmod 777 /home/threiss/data/wordpress

			@sudo docker compose -f srcs/docker-compose.yml up -d --build

clean:
			@sudo docker compose -f srcs/docker-compose.yml down
			@sudo rm -rf /home/threiss/data/mariadb/*
			@sudo rm -rf /home/threiss/data/wordpress/*

re:			clean all

fclean: 	clean
			@sudo docker system prune -af

