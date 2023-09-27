import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class Musica {
  String _nome;
  DateTime _dataLancamento;
  double _duracao;

  Musica(this._nome, this._dataLancamento, this._duracao);

  String get nome => _nome;
  DateTime get dataLancamento => _dataLancamento;
  double get duracao => _duracao;
}

class AlbumDeMusica {
  String _nome;
  String _artista;
  List<Musica> _musicas;

  AlbumDeMusica(this._nome, this._artista, this._musicas);

  String get nome => _nome;
  String get artista => _artista;
  List<Musica> get musicas => _musicas;
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedNavItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Eras Tour'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Item de Navegação 1'),
              onTap: () {
                setState(() {
                  _selectedNavItem = 1;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              title: Text('The Eras Tour - Álbuns'),
              onTap: () {
                setState(() {
                  _selectedNavItem = 2;
                  Navigator.pop(context);
                });
              },
            ),
          ],
        ),
      ),
      body: Builder(
      builder: (BuildContext context) {
      if (_selectedNavItem == 0) {
            // Conteúdo principal da tela inicial
            return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                          height: 500.0,   
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration: Duration(milliseconds: 800),),
                          items: [
                          '../assets/imagen-promocional-de-the-eras-tour.jpeg',
                          '../assets/imagen-promocional-de-the-eras-tour.jpeg' ,
                          '../assets/imagen-promocional-de-the-eras-tour.jpeg', 
                          '../assets/imagen-promocional-de-the-eras-tour.jpeg',
                          '../assets/imagen-promocional-de-the-eras-tour.jpeg'].map((String imagePath) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    image: DecorationImage(
                                      image: AssetImage(imagePath), // Caminho para a imagem
                                      fit: BoxFit.cover, // Ajuste da imagem no container
                                     )),
                                );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0), // Espaçamento horizontal
                child: Text(
                  'Após 11 anos desde sua primeira e última visita, Taylor Swift VIRÁ AO BRASIL com a turnê The Eras – que busca celebrar seus dez álbuns de estúdio e envolver os fãs em uma linha do tempo nostálgica através de sua carreira por 3 horas e 20 minutos de show.'
                  'Taylor Swift anunciou, no ano passado, as 52 datas que sua primeira turnê faria nos Estados Unidos com uma frase que deixou muitos fãs eufóricos: “Datas internacionais serão anunciadas assim que possível”.'
                  'Desde então, os Swifties brasileiros, que foram afetados financeiramente e psicologicamente pelo cancelamento da Lover Fest de 2020, estavam sem dormir, apreensivos, ansiosos e esperançosos que Taylor não demoraria mais 10 anos para visitar o país. Felizmente, a loirinha ouviu nossas preces e anunciou 2 shows em São Paulo e 1 no Rio de Janeiro!'
                  'A passagem de Taylor pelo Brasil será nos estádios Engenhão e Allianz Parque, que contam com a capacidade de 46 mil e 44 mil pessoas, respectivamente! Além do Brasil, Taylor anunciou as datas no México e Argentina.',
                  style: TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
      } else if (_selectedNavItem == 1) {
            // Conteúdo da tela para o Item de Navegação 1
            return ListView(
              children: [
                ListTile(
                  title: Text('Multi Child Widget'),
                ),
                PanfletoList(),
              ],
            );
          } else {
            // Conteúdo da tela para o Item de Navegação 2
            return Scaffold(
              body: ListAlbunsPage(title: 'Álbuns'),
            );
          }
        },
      ),
    );
  }
}

class PanfletoList extends StatelessWidget {
  final List<String> panfletos = [
    'Panfleto 1',
    'Panfleto 2',
    'Panfleto 3',
    'Panfleto 4',
    'Panfleto 5',
    'Panfleto 6',
    'Panfleto 7',
    // Adicione mais panfletos conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
  return ListView.builder(
    scrollDirection: Axis.horizontal, // Rolagem horizontal
    itemCount: panfletos.length,
    itemBuilder: (BuildContext context, int index) {
      return Card(
        child: PanfletoCard(panfleto: panfletos[index]),
      );
    },
  );
 }
}

class PanfletoCard extends StatelessWidget {
  final String panfleto;

  PanfletoCard({required this.panfleto});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Largura do card
      margin: EdgeInsets.all(8), // Espaçamento ao redor do card
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            panfleto,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          // Adicione mais widgets aqui, como imagens ou descrições
        ],
      ),
    );
  }
}


class ListAlbunsPage extends StatelessWidget {
  ListAlbunsPage({required this.title});
  final String title;

  List<AlbumDeMusica> _albuns = [
    AlbumDeMusica("Álbum 1", "Artista 1", [
      Musica("Música 1", DateTime(2023, 11, 17), 4.5),
      Musica("Música 2", DateTime(2023, 12, 1), 3.2),
    ]),
    AlbumDeMusica("Álbum 2", "Artista 2", [
      Musica("Música 3", DateTime(2023, 1, 3), 5.1),
      Musica("Música 4", DateTime(2023, 3, 13), 2.7),
      Musica("Música 5", DateTime(2022, 5, 2), 4.3),
    ]),
    AlbumDeMusica("Álbum 3", "Artista 3", [
      Musica("Música 6", DateTime(2021, 1, 3), 3.0),
      Musica("Música 7", DateTime(2021, 3, 3), 2.2),
      Musica("Música 8", DateTime(2021, 3, 21), 3.7),
    ]),
  ];

  void navigateToAlbumDeMusica(
    BuildContext context, AlbumDeMusica albumDeMusica) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AlbumDeMusicaWidget(albumDeMusica)),
    );
  }

  ListTile createClienteWidget(
      BuildContext context, AlbumDeMusica albumDeMusica) {
    return ListTile(
      title: Text(albumDeMusica.nome),
      subtitle: Text(albumDeMusica._artista),
      trailing: Icon(Icons.arrow_right),
      onTap: () {
        navigateToAlbumDeMusica(context, albumDeMusica);
      },
    );
  }

  Widget build(BuildContext context) {
    List<Widget> listaAlbuns = List.from(_albuns
        .map((AlbumDeMusica cliente) => createClienteWidget(context, cliente)));
    return Scaffold(
      appBar: AppBar(
        title: Text("Álbuns"),
      ),
      body: Center(
        child: ListView(children: listaAlbuns),
      ),
    );
  }
}

class AlbumDeMusicaWidget extends StatelessWidget {
  AlbumDeMusica _albumDeMusica;

  AlbumDeMusicaWidget(this._albumDeMusica);

  void navigateToMusica(
      BuildContext context, AlbumDeMusica albumDeMusica, Musica musica) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MusicaWidget(albumDeMusica, musica);
    }));
  }

  ListTile createListaMusicaWidget(
      BuildContext context, AlbumDeMusica albumDeMusica, Musica musica) {
    return ListTile(
      title: Text(musica._nome),
      subtitle: Text("${musica._dataLancamento.day}/${musica._duracao}"),
      trailing: Icon(Icons.arrow_right),
      onTap: () => navigateToMusica(context, albumDeMusica, musica),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> listaMusicasAlbum = List.from(_albumDeMusica._musicas.map(
        (Musica musica) =>
            createListaMusicaWidget(context, _albumDeMusica, musica)));
    listaMusicasAlbum.insert(
        0,
        Container(
          child: Column(
            children: <Widget>[
              Text(
                _albumDeMusica.nome,
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "${_albumDeMusica._musicas.length} Músicas",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          padding: EdgeInsets.all(20.0),
        ));
    return Scaffold(
      appBar: AppBar(title: Text("Informações do Álbum")),
      body: Center(
        child: ListView(
          children: listaMusicasAlbum,
        ),
      ),
    );
  }
}

class MusicaWidget extends StatelessWidget {
  AlbumDeMusica _albumDeMusica;
  Musica _musica;

  MusicaWidget(this._albumDeMusica, this._musica);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Informações de Música"),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              Text(
                _albumDeMusica.nome,
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                _albumDeMusica.artista,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(""),
              Text(
                _musica._nome,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text("${_musica._dataLancamento.day}/${_musica._duracao}",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center)
            ],
          ),
        ));
  }
}

