import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}
//colores definidos y tiene suffle para cambiar
class _PrincipalState extends State<Principal> {
  final List<Color> _colores = [
    Colors.purple, Colors.green, Colors.orange, Colors.pink,
    Colors.blue, Colors.teal, Colors.cyan, Colors.lime,
    Colors.indigo, Colors.amber
  ];
  late List<Color> _coloresJuego;
  late List<Color> _coloresMostrados;
  late List<bool> _estanVolteados;
  late int _contadorVolteados;
  late int _primerIndiceVolteado;
  late bool _juegoTerminado;

  @override
  void initState() {
    super.initState();
    _inicializarJuego();
  }

  void _inicializarJuego() {
    _colores.shuffle();
    _coloresJuego = List.generate(20, (index) => _colores[index % 10])..shuffle();
    _coloresMostrados = List.filled(20, Colors.grey);
    _estanVolteados = List.filled(20, false);
    _contadorVolteados = 0;
    _primerIndiceVolteado = -1;
    _juegoTerminado = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Memorama - Cedillo Grimaldo Cristian Alejandro'),
            const SizedBox(width: 10), // Espacio entre texto y botón
            ElevatedButton(
              onPressed: _juegoTerminado
                  ? () {
                      setState(() {
                        _inicializarJuego();
                      });
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 36),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Reiniciar'),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: AspectRatio(
                    aspectRatio: 1.0, 
                    child: InkWell(
                      // Si _juegoTerminado es true, desactiva el onTap 
                      onTap: _juegoTerminado ? null : () {
                        //Comprobar si esta volteado
                        if (!_estanVolteados[0]) {
                          setState(() {
                            _coloresMostrados[0] = _coloresJuego[0];
                            //lo coloca como verdadero
                            _estanVolteados[0] = true;
                            _contadorVolteados++;
                            if (_contadorVolteados == 1) _primerIndiceVolteado = 0;
                            else if (_contadorVolteados == 2) {
                              if (_coloresJuego[_primerIndiceVolteado] != _coloresJuego[0]) {
                                // Si no coinciden, espera 1 segundo antes de ocultarlas.
                                Future.delayed(const Duration(seconds: 1), () { 
                                  setState(() {
                                    _coloresMostrados[_primerIndiceVolteado] = Colors.grey;
                                    _coloresMostrados[0] = Colors.grey;
                                    _estanVolteados[_primerIndiceVolteado] = false;
                                    _estanVolteados[0] = false;
                                    _contadorVolteados = 0;
                                  });
                                });
                              } else _contadorVolteados = 0;
                              if (_estanVolteados.every((volteado) => volteado)) _juegoTerminado = true;
                            }
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        color: _coloresMostrados[0],
                      ),
                    ),
                  ),
                ),
                //literal se repite todo muchas veces con solo sus numeros
                Expanded(
                  flex: 3,
                  child: AspectRatio(
                    //no funciona no se por que
                    aspectRatio: 1.0, 
                    child: InkWell(
                      onTap: _juegoTerminado ? null : () {
                        if (!_estanVolteados[1]) {
                          setState(() {
                            _coloresMostrados[1] = _coloresJuego[1];
                            _estanVolteados[1] = true;
                            _contadorVolteados++;
                            if (_contadorVolteados == 1) _primerIndiceVolteado = 1;
                            else if (_contadorVolteados == 2) {
                              if (_coloresJuego[_primerIndiceVolteado] != _coloresJuego[1]) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    _coloresMostrados[_primerIndiceVolteado] = Colors.grey;
                                    _coloresMostrados[1] = Colors.grey;
                                    _estanVolteados[_primerIndiceVolteado] = false;
                                    _estanVolteados[1] = false;
                                    _contadorVolteados = 0;
                                  });
                                });
                              } else _contadorVolteados = 0;
                              if (_estanVolteados.every((volteado) => volteado)) _juegoTerminado = true;
                            }
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        color: _coloresMostrados[1],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: AspectRatio(
                    aspectRatio: 1.0, 
                    child: InkWell(
                      onTap: _juegoTerminado ? null : () {
                        if (!_estanVolteados[2]) {
                          setState(() {
                            _coloresMostrados[2] = _coloresJuego[2];
                            _estanVolteados[2] = true;
                            _contadorVolteados++;
                            if (_contadorVolteados == 1) _primerIndiceVolteado = 2;
                            else if (_contadorVolteados == 2) {
                              if (_coloresJuego[_primerIndiceVolteado] != _coloresJuego[2]) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    _coloresMostrados[_primerIndiceVolteado] = Colors.grey;
                                    _coloresMostrados[2] = Colors.grey;
                                    _estanVolteados[_primerIndiceVolteado] = false;
                                    _estanVolteados[2] = false;
                                    _contadorVolteados = 0;
                                  });
                                });
                              } else _contadorVolteados = 0;
                              if (_estanVolteados.every((volteado) => volteado)) _juegoTerminado = true;
                            }
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        color: _coloresMostrados[2],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: AspectRatio(
                    aspectRatio: 1.0, 
                    child: InkWell(
                      onTap: _juegoTerminado ? null : () {
                        if (!_estanVolteados[3]) {
                          setState(() {
                            _coloresMostrados[3] = _coloresJuego[3];
                            _estanVolteados[3] = true;
                            _contadorVolteados++;
                            if (_contadorVolteados == 1) _primerIndiceVolteado = 3;
                            else if (_contadorVolteados == 2) {
                              if (_coloresJuego[_primerIndiceVolteado] != _coloresJuego[3]) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    _coloresMostrados[_primerIndiceVolteado] = Colors.grey;
                                    _coloresMostrados[3] = Colors.grey;
                                    _estanVolteados[_primerIndiceVolteado] = false;
                                    _estanVolteados[3] = false;
                                    _contadorVolteados = 0;
                                  });
                                });
                              } else _contadorVolteados = 0;
                              if (_estanVolteados.every((volteado) => volteado)) _juegoTerminado = true;
                            }
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        color: _coloresMostrados[3],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: AspectRatio(
                    aspectRatio: 1.0, 
                    child: InkWell(
                      onTap: _juegoTerminado ? null : () {
                        if (!_estanVolteados[4]) {
                          setState(() {
                            _coloresMostrados[4] = _coloresJuego[4];
                            _estanVolteados[4] = true;
                            _contadorVolteados++;
                            if (_contadorVolteados == 1) _primerIndiceVolteado = 4;
                            else if (_contadorVolteados == 2) {
                              if (_coloresJuego[_primerIndiceVolteado] != _coloresJuego[4]) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    _coloresMostrados[_primerIndiceVolteado] = Colors.grey;
                                    _coloresMostrados[4] = Colors.grey;
                                    _estanVolteados[_primerIndiceVolteado] = false;
                                    _estanVolteados[4] = false;
                                    _contadorVolteados = 0;
                                  });
                                });
                              } else _contadorVolteados = 0;
                              if (_estanVolteados.every((volteado) => volteado)) _juegoTerminado = true;
                            }
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        color: _coloresMostrados[4],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: InkWell(
                      onTap: _juegoTerminado ? null : () {
                        if (!_estanVolteados[5]) {
                          setState(() {
                            _coloresMostrados[5] = _coloresJuego[5];
                            _estanVolteados[5] = true;
                            _contadorVolteados++;
                            if (_contadorVolteados == 1) _primerIndiceVolteado = 5;
                            else if (_contadorVolteados == 2) {
                              if (_coloresJuego[_primerIndiceVolteado] != _coloresJuego[5]) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    _coloresMostrados[_primerIndiceVolteado] = Colors.grey;
                                    _coloresMostrados[5] = Colors.grey;
                                    _estanVolteados[_primerIndiceVolteado] = false;
                                    _estanVolteados[5] = false;
                                    _contadorVolteados = 0;
                                  });
                                });
                              } else _contadorVolteados = 0;
                              if (_estanVolteados.every((volteado) => volteado)) _juegoTerminado = true;
                            }
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        color: _coloresMostrados[5],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: AspectRatio(
                    aspectRatio: 1.0, 
                    child: InkWell(
                      onTap: _juegoTerminado ? null : () {
                        if (!_estanVolteados[6]) {
                          setState(() {
                            _coloresMostrados[6] = _coloresJuego[6];
                            _estanVolteados[6] = true;
                            _contadorVolteados++;
                            if (_contadorVolteados == 1) _primerIndiceVolteado = 6;
                            else if (_contadorVolteados == 2) {
                              if (_coloresJuego[_primerIndiceVolteado] != _coloresJuego[6]) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    _coloresMostrados[_primerIndiceVolteado] = Colors.grey;
                                    _coloresMostrados[6] = Colors.grey;
                                    _estanVolteados[_primerIndiceVolteado] = false;
                                    _estanVolteados[6] = false;
                                    _contadorVolteados = 0;
                                  });
                                });
                              } else _contadorVolteados = 0;
                              if (_estanVolteados.every((volteado) => volteado)) _juegoTerminado = true;
                            }
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        color: _coloresMostrados[6],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: AspectRatio(
                    aspectRatio: 1.0, 
                    child: InkWell(
                      onTap: _juegoTerminado ? null : () {
                        if (!_estanVolteados[7]) {
                          setState(() {
                            _coloresMostrados[7] = _coloresJuego[7];
                            _estanVolteados[7] = true;
                            _contadorVolteados++;
                            if (_contadorVolteados == 1) _primerIndiceVolteado = 7;
                            else if (_contadorVolteados == 2) {
                              if (_coloresJuego[_primerIndiceVolteado] != _coloresJuego[7]) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    _coloresMostrados[_primerIndiceVolteado] = Colors.grey;
                                    _coloresMostrados[7] = Colors.grey;
                                    _estanVolteados[_primerIndiceVolteado] = false;
                                    _estanVolteados[7] = false;
                                    _contadorVolteados = 0;
                                  });
                                });
                              } else _contadorVolteados = 0;
                              if (_estanVolteados.every((volteado) => volteado)) _juegoTerminado = true;
                            }
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        color: _coloresMostrados[7],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: AspectRatio(
                    aspectRatio: 1.0, 
                    child: InkWell(
                      onTap: _juegoTerminado ? null : () {
                        if (!_estanVolteados[8]) {
                          setState(() {
                            _coloresMostrados[8] = _coloresJuego[8];
                            _estanVolteados[8] = true;
                            _contadorVolteados++;
                            if (_contadorVolteados == 1) _primerIndiceVolteado = 8;
                            else if (_contadorVolteados == 2) {
                              if (_coloresJuego[_primerIndiceVolteado] != _coloresJuego[8]) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    _coloresMostrados[_primerIndiceVolteado] = Colors.grey;
                                    _coloresMostrados[8] = Colors.grey;
                                    _estanVolteados[_primerIndiceVolteado] = false;
                                    _estanVolteados[8] = false;
                                    _contadorVolteados = 0;
                                  });
                                });
                              } else _contadorVolteados = 0;
                              if (_estanVolteados.every((volteado) => volteado)) _juegoTerminado = true;
                            }
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        color: _coloresMostrados[8],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: AspectRatio(
                    aspectRatio: 1.0, 
                    child: InkWell(
                      onTap: _juegoTerminado ? null : () {
                        if (!_estanVolteados[9]) {
                          setState(() {
                            _coloresMostrados[9] = _coloresJuego[9];
                            _estanVolteados[9] = true;
                            _contadorVolteados++;
                            if (_contadorVolteados == 1) _primerIndiceVolteado = 9;
                            else if (_contadorVolteados == 2) {
                              if (_coloresJuego[_primerIndiceVolteado] != _coloresJuego[9]) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    _coloresMostrados[_primerIndiceVolteado] = Colors.grey;
                                    _coloresMostrados[9] = Colors.grey;
                                    _estanVolteados[_primerIndiceVolteado] = false;
                                    _estanVolteados[9] = false;
                                    _contadorVolteados = 0;
                                  });
                                });
                              } else _contadorVolteados = 0;
                              if (_estanVolteados.every((volteado) => volteado)) _juegoTerminado = true;
                            }
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        color: _coloresMostrados[9],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: AspectRatio(
                    aspectRatio: 1.0, 
                    child: InkWell(
                      onTap: _juegoTerminado ? null : () {
                        if (!_estanVolteados[10]) {
                          setState(() {
                            _coloresMostrados[10] = _coloresJuego[10];
                            _estanVolteados[10] = true;
                            _contadorVolteados++;
                            if (_contadorVolteados == 1) _primerIndiceVolteado = 10;
                            else if (_contadorVolteados == 2) {
                              if (_coloresJuego[_primerIndiceVolteado] != _coloresJuego[10]) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    _coloresMostrados[_primerIndiceVolteado] = Colors.grey;
                                    _coloresMostrados[10] = Colors.grey;
                                    _estanVolteados[_primerIndiceVolteado] = false;
                                    _estanVolteados[10] = false;
                                    _contadorVolteados = 0;
                                  });
                                });
                              } else _contadorVolteados = 0;
                              if (_estanVolteados.every((volteado) => volteado)) _juegoTerminado = true;
                            }
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        color: _coloresMostrados[10],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: AspectRatio(
                    aspectRatio: 1.0, 
                    child: InkWell(
                      onTap: _juegoTerminado ? null : () {
                        if (!_estanVolteados[11]) {
                          setState(() {
                            _coloresMostrados[11] = _coloresJuego[11];
                            _estanVolteados[11] = true;
                            _contadorVolteados++;
                            if (_contadorVolteados == 1) _primerIndiceVolteado = 11;
                            else if (_contadorVolteados == 2) {
                              if (_coloresJuego[_primerIndiceVolteado] != _coloresJuego[11]) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    _coloresMostrados[_primerIndiceVolteado] = Colors.grey;
                                    _coloresMostrados[11] = Colors.grey;
                                    _estanVolteados[_primerIndiceVolteado] = false;
                                    _estanVolteados[11] = false;
                                    _contadorVolteados = 0;
                                  });
                                });
                              } else _contadorVolteados = 0;
                              if (_estanVolteados.every((volteado) => volteado)) _juegoTerminado = true;
                            }
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        color: _coloresMostrados[11],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Otra parte
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: AspectRatio(
                    aspectRatio: 1.0, 
                    child: InkWell(
                      onTap: _juegoTerminado ? null : () {
                        if (!_estanVolteados[12]) {
                          setState(() {
                            _coloresMostrados[12] = _coloresJuego[12];
                            _estanVolteados[12] = true;
                            _contadorVolteados++;
                            if (_contadorVolteados == 1) _primerIndiceVolteado = 12;
                            else if (_contadorVolteados == 2) {
                              if (_coloresJuego[_primerIndiceVolteado] != _coloresJuego[12]) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    _coloresMostrados[_primerIndiceVolteado] = Colors.grey;
                                    _coloresMostrados[12] = Colors.grey;
                                    _estanVolteados[_primerIndiceVolteado] = false;
                                    _estanVolteados[12] = false;
                                    _contadorVolteados = 0;
                                  });
                                });
                              } else _contadorVolteados = 0;
                              if (_estanVolteados.every((volteado) => volteado)) _juegoTerminado = true;
                            }
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        color: _coloresMostrados[12],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: AspectRatio(
                    aspectRatio: 1.0, 
                    child: InkWell(
                      onTap: _juegoTerminado ? null : () {
                        if (!_estanVolteados[13]) {
                          setState(() {
                            _coloresMostrados[13] = _coloresJuego[13];
                            _estanVolteados[13] = true;
                            _contadorVolteados++;
                            if (_contadorVolteados == 1) _primerIndiceVolteado = 13;
                            else if (_contadorVolteados == 2) {
                              if (_coloresJuego[_primerIndiceVolteado] != _coloresJuego[13]) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    _coloresMostrados[_primerIndiceVolteado] = Colors.grey;
                                    _coloresMostrados[13] = Colors.grey;
                                    _estanVolteados[_primerIndiceVolteado] = false;
                                    _estanVolteados[13] = false;
                                    _contadorVolteados = 0;
                                  });
                                });
                              } else _contadorVolteados = 0;
                              if (_estanVolteados.every((volteado) => volteado)) _juegoTerminado = true;
                            }
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        color: _coloresMostrados[13],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: AspectRatio(
                    aspectRatio: 1.0, 
                    child: InkWell(
                      onTap: _juegoTerminado ? null : () {
                        if (!_estanVolteados[14]) {
                          setState(() {
                            _coloresMostrados[14] = _coloresJuego[14];
                            _estanVolteados[14] = true;
                            _contadorVolteados++;
                            if (_contadorVolteados == 1) _primerIndiceVolteado = 14;
                            else if (_contadorVolteados == 2) {
                              if (_coloresJuego[_primerIndiceVolteado] != _coloresJuego[14]) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    _coloresMostrados[_primerIndiceVolteado] = Colors.grey;
                                    _coloresMostrados[14] = Colors.grey;
                                    _estanVolteados[_primerIndiceVolteado] = false;
                                    _estanVolteados[14] = false;
                                    _contadorVolteados = 0;
                                  });
                                });
                              } else _contadorVolteados = 0;
                              if (_estanVolteados.every((volteado) => volteado)) _juegoTerminado = true;
                            }
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        color: _coloresMostrados[14],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: AspectRatio(
                    aspectRatio: 1.0, 
                    child: InkWell(
                      onTap: _juegoTerminado ? null : () {
                        if (!_estanVolteados[15]) {
                          setState(() {
                            _coloresMostrados[15] = _coloresJuego[15];
                            _estanVolteados[15] = true;
                            _contadorVolteados++;
                            if (_contadorVolteados == 1) _primerIndiceVolteado = 15;
                            else if (_contadorVolteados == 2) {
                              if (_coloresJuego[_primerIndiceVolteado] != _coloresJuego[15]) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    _coloresMostrados[_primerIndiceVolteado] = Colors.grey;
                                    _coloresMostrados[15] = Colors.grey;
                                    _estanVolteados[_primerIndiceVolteado] = false;
                                    _estanVolteados[15] = false;
                                    _contadorVolteados = 0;
                                  });
                                });
                              } else _contadorVolteados = 0;
                              if (_estanVolteados.every((volteado) => volteado)) _juegoTerminado = true;
                            }
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        color: _coloresMostrados[15],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: AspectRatio(
                    aspectRatio: 1.0, 
                    child: InkWell(
                      onTap: _juegoTerminado ? null : () {
                        if (!_estanVolteados[16]) {
                          setState(() {
                            _coloresMostrados[16] = _coloresJuego[16];
                            _estanVolteados[16] = true;
                            _contadorVolteados++;
                            if (_contadorVolteados == 1) _primerIndiceVolteado = 16;
                            else if (_contadorVolteados == 2) {
                              if (_coloresJuego[_primerIndiceVolteado] != _coloresJuego[16]) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    _coloresMostrados[_primerIndiceVolteado] = Colors.grey;
                                    _coloresMostrados[16] = Colors.grey;
                                    _estanVolteados[_primerIndiceVolteado] = false;
                                    _estanVolteados[16] = false;
                                    _contadorVolteados = 0;
                                  });
                                });
                              } else _contadorVolteados = 0;
                              if (_estanVolteados.every((volteado) => volteado)) _juegoTerminado = true;
                            }
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        color: _coloresMostrados[16],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: AspectRatio(
                    aspectRatio: 1.0, 
                    child: InkWell(
                      onTap: _juegoTerminado ? null : () {
                        if (!_estanVolteados[17]) {
                          setState(() {
                            _coloresMostrados[17] = _coloresJuego[17];
                            _estanVolteados[17] = true;
                            _contadorVolteados++;
                            if (_contadorVolteados == 1) _primerIndiceVolteado = 17;
                            else if (_contadorVolteados == 2) {
                              if (_coloresJuego[_primerIndiceVolteado] != _coloresJuego[17]) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    _coloresMostrados[_primerIndiceVolteado] = Colors.grey;
                                    _coloresMostrados[17] = Colors.grey;
                                    _estanVolteados[_primerIndiceVolteado] = false;
                                    _estanVolteados[17] = false;
                                    _contadorVolteados = 0;
                                  });
                                });
                              } else _contadorVolteados = 0;
                              if (_estanVolteados.every((volteado) => volteado)) _juegoTerminado = true;
                            }
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        color: _coloresMostrados[17],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: AspectRatio(
                    aspectRatio: 1.0, 
                    child: InkWell(
                      onTap: _juegoTerminado ? null : () {
                        if (!_estanVolteados[18]) {
                          setState(() {
                            _coloresMostrados[18] = _coloresJuego[18];
                            _estanVolteados[18] = true;
                            _contadorVolteados++;
                            if (_contadorVolteados == 1) _primerIndiceVolteado = 18;
                            else if (_contadorVolteados == 2) {
                              if (_coloresJuego[_primerIndiceVolteado] != _coloresJuego[18]) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    _coloresMostrados[_primerIndiceVolteado] = Colors.grey;
                                    _coloresMostrados[18] = Colors.grey;
                                    _estanVolteados[_primerIndiceVolteado] = false;
                                    _estanVolteados[18] = false;
                                    _contadorVolteados = 0;
                                  });
                                });
                              } else _contadorVolteados = 0;
                              if (_estanVolteados.every((volteado) => volteado)) _juegoTerminado = true;
                            }
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        color: _coloresMostrados[18],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: AspectRatio(
                    aspectRatio: 1.0, 
                    child: InkWell(
                      onTap: _juegoTerminado ? null : () {
                        if (!_estanVolteados[19]) {
                          setState(() {
                            _coloresMostrados[19] = _coloresJuego[19];
                            _estanVolteados[19] = true;
                            _contadorVolteados++;
                            if (_contadorVolteados == 1) _primerIndiceVolteado = 19;
                            else if (_contadorVolteados == 2) {
                              if (_coloresJuego[_primerIndiceVolteado] != _coloresJuego[19]) {
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    _coloresMostrados[_primerIndiceVolteado] = Colors.grey;
                                    _coloresMostrados[19] = Colors.grey;
                                    _estanVolteados[_primerIndiceVolteado] = false;
                                    _estanVolteados[19] = false;
                                    _contadorVolteados = 0;
                                  });
                                });
                              } else _contadorVolteados = 0;
                              if (_estanVolteados.every((volteado) => volteado)) _juegoTerminado = true;
                            }
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        color: _coloresMostrados[19],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}