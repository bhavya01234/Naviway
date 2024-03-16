import 'package:flutter/material.dart';
import 'package:navigate/address_services.dart';
import 'package:navigate/widgets/custom_field.dart';

class AddressDetails extends StatefulWidget {
   final String addr;
   final String l1;
   final String l2;
   final String p;
    AddressDetails({super.key,
   required this.addr, required this.l1, required this.l2 , required this.p});

  @override
  State<AddressDetails> createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetails> {
  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  final _addressFormKey = GlobalKey<FormState>();

  final AddressServices addressServices = AddressServices();
  @override
  void dispose() {
    super.dispose();
    flatBuildingController.dispose();
    areaController.dispose();
    pincodeController.dispose();
    cityController.dispose();
  }
  void address_save(){
    addressServices.saveUserAddress(context: context,latit: widget.l1, longit: widget.l2, flat: flatBuildingController.text, area: areaController.text, pincode: pincodeController.text, town: cityController.text, ph: widget.p);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              //gradient: GlobalVariables.appBarGradient,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              children: [
              // if (address.isNotEmpty)
          Column(
        children: [
        Container(
        width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black12,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
             widget.addr,

              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'OR',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 20),
        ],
      ),
      Form(
        key: _addressFormKey,
        child: Column(
          children: [
            CustomTextField(
              controller: flatBuildingController,
              hintText: 'Flat, House no, Building',
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: areaController,
              hintText: 'Area, Street',
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: pincodeController,
              hintText: 'Pincode',
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: cityController,
              hintText: 'Town/City',
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
                ElevatedButton(onPressed: address_save, child: Text("SUBMIT")),
    ]),
    ),
    ),
    );
  }
}
