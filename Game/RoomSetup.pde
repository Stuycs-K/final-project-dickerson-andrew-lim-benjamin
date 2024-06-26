Room[][] createRooms(){
  int[][] room00Layout = {
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 0, 0, 0, 3, 0, 0, 0, 4, 4, 4, 0, 0, 0, 1},
    {1, 0, 7, 0, 3, 0, 0, 4, 4, 4, 4, 4, 0, 0, 1},
    {1, 0, 0, 0, 1, 0, 0, 4, 4, 4, 4, 4, 0, 0, 1},
    {1, 0, 1, 1, 3, 0, 0, 0, 4, 4, 4, 4, 0, 0, 9},
    {1, 3, 1, 0, 0, 0, 0, 0, 0, 4, 4, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1}
  };
  Room room00 = new Room(room00Layout);

  int[][] room01Layout = {
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 1, 3, 0, 1, 0, 0, 0, 0, 1, 0, 0, 3, 1, 1},
    {9, 0, 3, 0, 1, 0, 0, 0, 0, 1, 0, 0, 3, 0, 9},
    {1, 3, 3, 0, 1, 0, 0, 0, 0, 1, 0, 0, 3, 3, 1},
    {1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},
    {1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1}
  };
  Room room01 = new Room(room01Layout);

  int[][] room02Layout = {
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 4, 4, 4, 4, 4, 0, 0, 0, 0, 1},
    {9, 0, 0, 0, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 1},
    {1, 0, 0, 0, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 4, 4, 4, 4, 4, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 1, 1}
  };
  Room room02 = new Room(room02Layout);

  int[][] room10Layout = {
    {1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1},
    {1, 0, 0, 4, 4, 4, 4, 0, 0, 0, 4, 4, 4, 0, 1},
    {1, 0, 4, 4, 4, 4, 0, 0, 0, 0, 4, 4, 4, 0, 9},
    {1, 0, 0, 4, 4, 4, 4, 0, 0, 4, 4, 4, 0, 0, 1},
    {1, 0, 0, 0, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 4, 4, 4, 4, 4, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 4, 4, 4, 4, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 4, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1}
  };
  Room room10 = new Room(room10Layout);

  int[][] room11Layout = {
    {1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1},
    {1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 3, 0, 0, 0, 0, 0, 3, 0, 0, 0, 1},
    {1, 0, 0, 0, 3, 0, 0, 0, 0, 0, 3, 0, 0, 0, 1},
    {1, 0, 0, 0, 3, 0, 0, 0, 0, 0, 3, 0, 0, 0, 9},
    {1, 0, 0, 0, 3, 0, 0, 0, 0, 0, 3, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1}
  };
  Room room11 = new Room(room11Layout);

  int[][] room12Layout = {
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 1, 1},
    {1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1},
    {1, 1, 0, 0, 0, 0, 1, 1, 3, 1, 0, 0, 0, 1, 1},
    {1, 0, 0, 0, 0, 1, 1, 1, 1, 3, 0, 0, 1, 1, 1},
    {9, 0, 0, 0, 0, 3, 1, 1, 1, 0, 0, 0, 1, 1, 1},
    {1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 3, 1, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 3, 3, 1},
    {1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1},
    {1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1}
  };
  Room room12 = new Room(room12Layout);

  int[][] room20Layout = {
    {1, 1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 3, 3, 1, 1, 1, 1, 1, 1, 3, 3, 1, 0, 1},
    {1, 0, 1, 3, 1, 1, 1, 1, 3, 1, 1, 1, 1, 0, 1},
    {1, 0, 1, 1, 3, 3, 3, 3, 3, 3, 1, 1, 1, 0, 9},
    {1, 0, 1, 3, 7, 1, 3, 1, 1, 3, 1, 3, 1, 0, 1},
    {1, 0, 1, 1, 1, 1, 3, 3, 1, 1, 3, 1, 3, 0, 1},
    {1, 0, 1, 1, 1, 1, 1, 3, 3, 1, 1, 3, 3, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
  };
  Room room20 = new Room(room20Layout);

  int[][] room21Layout = {
    {1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1},
    {1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 3, 1},
    {9, 0, 0, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 3, 9},
    {1, 0, 0, 0, 0, 0, 3, 3, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
  };
  Room room21 = new Room(room21Layout);

  int[][] room22Layout = {
    {1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1},
    {1, 3, 0, 0, 0, 0, 0, 0, 0, 4, 4, 4, 0, 7, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 4, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 4, 4, 4, 0, 0, 0, 1},
    {9, 0, 0, 0, 0, 0, 4, 4, 4, 1, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 4, 4, 4, 4, 0, 1, 0, 0, 0, 0, 1},
    {1, 0, 4, 4, 4, 4, 0, 0, 0, 3, 0, 0, 0, 0, 1},
    {1, 0, 0, 4, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
  };
  Room room22 = new Room(room22Layout);

  Room[][] rooms = new Room[3][3];
  rooms[0][0] = room00;
  rooms[0][1] = room01;
  rooms[0][2] = room02;
  rooms[1][0] = room10;
  rooms[1][1] = room11;
  rooms[1][2] = room12;
  rooms[2][0] = room20;
  rooms[2][1] = room21;
  rooms[2][2] = room22;

  return rooms;
}

Map initializeMap(){
  Room[][] rooms = createRooms();
  Map map = new Map(rooms);
  return map;
}
