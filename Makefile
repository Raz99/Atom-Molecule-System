CC = gcc
CFLAGS = -g -Wall -fprofile-arcs -ftest-coverage

SRV_DIR = server
CLI_DIR = clients

TARGET_SERVER = drinks_bar
TARGET_TCP_CLIENT = atom_supplier
TARGET_UDP_CLIENT = molecule_requester

SRV_OBJ = $(SRV_DIR)/drinks_bar.o
TCP_OBJ = $(CLI_DIR)/atom_supplier.o
UDP_OBJ = $(CLI_DIR)/molecule_requester.o

.PHONY: all clean

all: $(TARGET_SERVER) $(TARGET_TCP_CLIENT) $(TARGET_UDP_CLIENT)

$(TARGET_SERVER): $(SRV_OBJ)
	$(CC) $(CFLAGS) -o $@ $^

$(TARGET_TCP_CLIENT): $(TCP_OBJ)
	$(CC) $(CFLAGS) -o $@ $^

$(TARGET_UDP_CLIENT): $(UDP_OBJ)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(SRV_OBJ): $(SRV_DIR)/drinks_bar.c
	$(CC) $(CFLAGS) -c $< -o $@

$(TCP_OBJ): $(CLI_DIR)/atom_supplier.c
	$(CC) $(CFLAGS) -c $< -o $@

$(UDP_OBJ): $(CLI_DIR)/molecule_requester.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(TARGET_SERVER) $(TARGET_TCP_CLIENT) $(TARGET_UDP_CLIENT) *.o $(SRV_DIR)/*.o $(CLI_DIR)/*.o $(SRV_DIR)/*.socket $(CLI_DIR)/*.socket $(SRV_DIR)/*.dat $(CLI_DIR)/*.dat $(SRV_DIR)/*.gcda $(CLI_DIR)/*.gcda $(SRV_DIR)/*.gcno $(CLI_DIR)/*.gcno $(SRV_DIR)/*.gcov $(CLI_DIR)/*.gcov