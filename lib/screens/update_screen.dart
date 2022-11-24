import 'package:api_kullanimi/DetailScreen.dart';
import 'package:api_kullanimi/services/api_service.dart';
import 'package:api_kullanimi/models/users_model.dart';
import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final formKey = GlobalKey<FormState>();
  late Future<UserModel> _updateUser;
  late Geo geoVariable = Geo(lat: latitute, lng: longtitute);
  late Address addressVariable = Address(
      street: street,
      suite: suite,
      city: city,
      zipcode: zipcode,
      geo: geoVariable);
  late Company companyVariable = Company(
      name: companyName, catchPhrase: companyCatchPhrase, bs: companyBs);
  late String name,
      username,
      email,
      phone,
      website,
      companyName,
      companyCatchPhrase,
      companyBs,
      city,
      street,
      suite,
      zipcode,
      latitute,
      longtitute;

  @override
  void initState() {
    super.initState();
    _updateUser = ApiService().fetchUser(widget.user.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EDIT"),
        elevation: 15,
        backgroundColor: Colors.red,
        shadowColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value != null) {
                      if (value.isEmpty) {
                        return 'It cannot be empty';
                      } else {
                        return null;
                      }
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    name = newValue!;
                  },
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: widget.user.name,
                      labelText: "Name*",
                      labelStyle: const TextStyle(color: Colors.redAccent)),
                  style: const TextStyle(
                    backgroundColor: Colors.white54,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value != null) {
                      if (value.isEmpty) {
                        return 'It cannot be empty';
                      } else {
                        return null;
                      }
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    username = newValue!;
                  },
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: widget.user.username,
                      labelText: "Username*",
                      labelStyle: const TextStyle(color: Colors.redAccent)),
                  style: const TextStyle(
                    backgroundColor: Colors.white54,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (!value!.contains('@') || !value.contains('.com')) {
                      return "Please enter a valid email address";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    email = newValue!;
                  },
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: widget.user.email,
                      labelText: "Email*",
                      labelStyle: const TextStyle(color: Colors.redAccent)),
                  style: const TextStyle(
                    backgroundColor: Colors.white54,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value != null) {
                      if (value.isEmpty) {
                        return 'It cannot be empty';
                      } else {
                        return null;
                      }
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    phone = newValue!;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: widget.user.phone,
                      labelText: "Phone*",
                      labelStyle: const TextStyle(color: Colors.redAccent)),
                  style: const TextStyle(
                    backgroundColor: Colors.white54,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value != null) {
                      if (value.isEmpty) {
                        return 'It cannot be empty';
                      } else {
                        return null;
                      }
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    website = newValue!;
                  },
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: widget.user.website,
                      labelText: "Website*",
                      labelStyle: const TextStyle(color: Colors.redAccent)),
                  style: const TextStyle(
                    backgroundColor: Colors.white54,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value != null) {
                      if (value.isEmpty) {
                        return 'It cannot be empty';
                      } else {
                        return null;
                      }
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    companyName = newValue!;
                  },
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: widget.user.company.name,
                      labelText: "Company Name*",
                      labelStyle: const TextStyle(color: Colors.redAccent)),
                  style: const TextStyle(
                    backgroundColor: Colors.white54,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value != null) {
                      if (value.isEmpty) {
                        return 'It cannot be empty';
                      } else {
                        return null;
                      }
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    companyCatchPhrase = newValue!;
                  },
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: widget.user.company.catchPhrase,
                      labelText: "Company CatchPhrase*",
                      labelStyle: const TextStyle(color: Colors.redAccent)),
                  style: const TextStyle(
                    backgroundColor: Colors.white54,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value != null) {
                      if (value.isEmpty) {
                        return 'It cannot be empty';
                      } else {
                        return null;
                      }
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    companyBs = newValue!;
                  },
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: widget.user.company.bs,
                      labelText: "Company Bs*",
                      labelStyle: const TextStyle(color: Colors.redAccent)),
                  style: const TextStyle(
                    backgroundColor: Colors.white54,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value != null) {
                      if (value.isEmpty) {
                        return 'It cannot be empty';
                      } else {
                        return null;
                      }
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    city = newValue!;
                  },
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: widget.user.address.city,
                      labelText: "City*",
                      labelStyle: const TextStyle(color: Colors.redAccent)),
                  style: const TextStyle(
                    backgroundColor: Colors.white54,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value != null) {
                      if (value.isEmpty) {
                        return 'It cannot be empty';
                      } else {
                        return null;
                      }
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    street = newValue!;
                  },
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: widget.user.address.street,
                      labelText: "Street*",
                      labelStyle: const TextStyle(color: Colors.redAccent)),
                  style: const TextStyle(
                    backgroundColor: Colors.white54,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value != null) {
                      if (value.isEmpty) {
                        return 'It cannot be empty';
                      } else {
                        return null;
                      }
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    suite = newValue!;
                  },
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: widget.user.address.suite,
                      labelText: "Suite*",
                      labelStyle: const TextStyle(color: Colors.redAccent)),
                  style: const TextStyle(
                    backgroundColor: Colors.white54,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value != null) {
                      if (value.isEmpty) {
                        return 'It cannot be empty';
                      } else {
                        return null;
                      }
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    zipcode = newValue!;
                  },
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: widget.user.address.zipcode,
                      labelText: "Zipcode*",
                      labelStyle: const TextStyle(color: Colors.redAccent)),
                  style: const TextStyle(
                    backgroundColor: Colors.white54,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value != null) {
                      if (value.isEmpty) {
                        return 'It cannot be empty';
                      } else {
                        return null;
                      }
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    latitute = newValue!;
                  },
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: widget.user.address.geo.lat,
                      labelText: "Latitute*",
                      labelStyle: const TextStyle(color: Colors.redAccent)),
                  style: const TextStyle(
                    backgroundColor: Colors.white54,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value != null) {
                      if (value.isEmpty) {
                        return 'It cannot be empty';
                      } else {
                        return null;
                      }
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    longtitute = newValue!;
                  },
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: widget.user.address.geo.lng,
                      labelText: "Longtitute*",
                      labelStyle: const TextStyle(color: Colors.redAccent)),
                  style: const TextStyle(
                    backgroundColor: Colors.white54,
                  ),
                ),
              ),
              Center(
                child: FutureBuilder<UserModel>(
                  future: _updateUser,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return ElevatedButton(
                          onPressed: () {
                            final bool? icerikUygunMu =
                                formKey.currentState?.validate();
                            if (icerikUygunMu == true) {
                              formKey.currentState?.save();
                              _updateUser = ApiService().updateUser(
                                  widget.user.id,
                                  name,
                                  username,
                                  email,
                                  addressVariable,
                                  phone,
                                  website,
                                  companyVariable);
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailScreen(user: widget.user)));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.only(
                                left: 150, right: 150, top: 10, bottom: 10),
                            textStyle: const TextStyle(
                              fontSize: 18,
                            ),
                            shadowColor: Colors.black,
                          ),
                          child: const Text("SAVE"),
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
