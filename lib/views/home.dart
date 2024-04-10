import 'package:final_yr_proj/assets.dart';
import 'package:final_yr_proj/widgets/key_value_col.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        "https://assets.ajio.com/medias/sys_master/root/20230602/kQQE/6479523ed55b7d0c633b17fd/-473Wx593H-462103471-grey-MODEL2.jpg";
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Order"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BodyHeader(),
              const BodyContainer(imageUrl: imageUrl),
              const SizedBox(
                height: 12.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 148, 46, 39),
                    borderRadius: BorderRadius.circular(4.0)),
                height: 20.0,
                width: 150.0,
                child: const Center(
                  child: Text(
                    "See Variant Details",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    return VarientTile(
                      title: dataList[index]["name"]!,
                      id: dataList[index]["id"]!,
                    );
                  }),
              const SizedBox(
                height: 20.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BodyHeader extends StatelessWidget {
  const BodyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          Text("Order"),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.arrow_forward_ios_rounded),
          SizedBox(
            width: 20,
          ),
          Text("23953"),
          Expanded(child: SizedBox()),
          KeyValueCol(keyName: "Shipping", valueName: "Tue Apr 09 2024"),
          SizedBox(
            width: 10.0,
          ),
          KeyValueCol(keyName: "Confirmation", valueName: "Thu Jan 26 2024"),
        ],
      ),
    );
  }
}

class BodyContainer extends StatelessWidget {
  final String imageUrl;
  const BodyContainer({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: Colors.white, border: Border.all(width: 0.2)),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          SizedBox(
            child: Row(
              children: [
                SizedBox(
                  height: 200,
                  width: 150,
                  child: Image.network(imageUrl),
                ),
                const SizedBox(
                  width: 14.0,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KeyValueCol(
                      keyName: "Name",
                      valueName: "Men Tees",
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    KeyValueCol(
                        keyName: "Quantity",
                        valueName: "120",
                        crossAxisAlignment: CrossAxisAlignment.start),
                    SizedBox(
                      height: 30.0,
                    ),
                    KeyValueCol(
                        keyName: "Price",
                        valueName: "4,100",
                        crossAxisAlignment: CrossAxisAlignment.start),
                  ],
                ),
                const Expanded(child: SizedBox()),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KeyValueCol(
                      keyName: "PD No.",
                      valueName: "Men Tees",
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    KeyValueCol(
                        keyName: "Style Code",
                        valueName: "120",
                        crossAxisAlignment: CrossAxisAlignment.start),
                    SizedBox(
                      height: 30.0,
                    ),
                    KeyValueCol(
                        keyName: "SRU",
                        valueName: "4.100",
                        crossAxisAlignment: CrossAxisAlignment.start),
                  ],
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class VarientTile extends StatelessWidget {
  final String title;
  final String id;
  const VarientTile({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ExpansionTile(
        collapsedBackgroundColor: const Color.fromARGB(255, 187, 187, 187),
        backgroundColor: const Color.fromARGB(255, 187, 187, 187),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 18.0),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 6.0),
                    color: const Color.fromARGB(255, 105, 105, 105),
                    child: const Center(
                        child: Text(
                      "NOT AT RISK",
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.w800),
                    )),
                  ),
                  const Expanded(child: SizedBox()),
                  const VarientSubTile(
                      icon: Icons.check_circle_outline,
                      iconColor: Colors.green,
                      title: "Visible to Buyer"),
                  const SizedBox(
                    width: 14.0,
                  ),
                  const VarientSubTile(
                      icon: Icons.cancel_outlined,
                      iconColor: Colors.red,
                      title: "Visible to Manufacturer"),
                  const Expanded(child: SizedBox()),
                  const Text(
                    "Not Started",
                    style:
                        TextStyle(fontWeight: FontWeight.w800, fontSize: 14.0),
                  )
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Order Status:  Pending",
                style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        children: [
          Container(
            width: double.infinity,
            color: Color.fromARGB(255, 244, 244, 244),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16.0,
                ),
                const Text("Buyer PO"),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DocUploadBox(id: id),
                    const SizedBox(
                      width: 16.0,
                    ),
                    ChatBox(id: id),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class VarientSubTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  const VarientSubTile(
      {super.key,
      required this.icon,
      required this.iconColor,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(width: 0.4)),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 16.0,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 12.0),
          )
        ],
      ),
    );
  }
}

class DocUploadBox extends StatefulWidget {
  final String id;
  const DocUploadBox({super.key, required this.id});

  @override
  State<DocUploadBox> createState() => _DocUploadBoxState();
}

class _DocUploadBoxState extends State<DocUploadBox> {
  bool isFileUploaded = false;
  bool loading = false;

  @override
  void initState() {
    isFileUploaded = data[widget.id]!["isDocUploaded"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          GestureDetector(
            onTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles();

              if (result != null) {
                loading = true;
                setState(() {});
                await Future.delayed(const Duration(seconds: 3));
                loading = false;
                isFileUploaded = true;
                data[widget.id]!["isDocUploaded"] = true;
                setState(() {});
              } else {
                // User canceled the picker
              }
            },
            child: Container(
              height: 250,
              decoration: BoxDecoration(border: Border.all(width: 0.2)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    "Docs",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Divider(
                    thickness: 1.2,
                    color: Colors.black,
                  ),
                  const Expanded(child: SizedBox()),
                  loading
                      ? const CircularProgressIndicator(
                          color: redAccent,
                        )
                      : Text(isFileUploaded
                          ? "File uploaded in database"
                          : "Click to upload Documents"),
                  const Expanded(child: SizedBox())
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              DocsCheckBox(
                text: "Require Approval",
                id: widget.id,
              ),
              DocsCheckBox(
                text: "Require Due Date",
                id: widget.id,
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            children: [
              DateBox(
                title: "Due Date",
                id: widget.id,
                isDueDate: true,
              ),
              const SizedBox(
                width: 12.0,
              ),
              DateBox(
                title: "Actual Date",
                id: widget.id,
                isDueDate: false,
              ),
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          // // TextButton(
          // //   onPressed: () {},
          // //   child: Text(
          // //     "Save",
          // //     style: TextStyle(color: Colors.white),
          // //   ),
          // //   style: TextButton.styleFrom(
          // //       backgroundColor: const Color.fromARGB(255, 148, 46, 39)),
          // // ),
          // const SizedBox(
          //   height: 12.0,
          // )
        ],
      ),
    );
  }
}

class DocsCheckBox extends StatefulWidget {
  bool? value;
  final String text;
  final String id;
  DocsCheckBox(
      {super.key, this.value = false, required this.text, required this.id});

  @override
  State<DocsCheckBox> createState() => _DocsCheckBoxState();
}

class _DocsCheckBoxState extends State<DocsCheckBox> {
  late String key;
  @override
  void initState() {
    key = widget.text == "Require Approval"
        ? "isRquiredApproval"
        : "isRquiredDueDate";
    widget.value = data[widget.id]![key];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: widget.value,
            onChanged: (val) {
              widget.value = val;
              data[widget.id]![key] = val;
              setState(() {});
            }),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          widget.text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class DateBox extends StatefulWidget {
  final String title;
  final String id;
  final bool isDueDate;
  const DateBox(
      {super.key,
      required this.title,
      required this.id,
      required this.isDueDate});

  @override
  State<DateBox> createState() => _DateBoxState();
}

class _DateBoxState extends State<DateBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8.0,
          ),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(border: Border.all(width: 0.3)),
              child: Center(
                  child: Text(
                widget.isDueDate
                    ? data[widget.id]!['dueDate']
                    : data[widget.id]!['actualDate'],
                style: const TextStyle(fontSize: 16.0),
              )),
            ),
            onTap: () async {
              var date = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(3000));
              if (date != null) {
                if (widget.isDueDate) {
                  data[widget.id]!['dueDate'] =
                      "${date.day}/${date.month}/${date.year}";
                } else {
                  data[widget.id]!['actualDate'] =
                      "${date.day}/${date.month}/${date.year}";
                }
                setState(() {});
              }
            },
          )
        ],
      ),
    );
  }
}

class ChatBox extends StatefulWidget {
  final String id;
  const ChatBox({super.key, required this.id});

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  List comments = [];

  @override
  void initState() {
    comments = data[widget.id]!["comments"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            height: 350,
            decoration: BoxDecoration(border: Border.all(width: 0.2)),
            child: Form(
              key: formKey,
              child: Stack(
                children: [
                  comments.isNotEmpty
                      ? SizedBox(
                          width: double.infinity,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: comments
                                  .map((e) => Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 8.0),
                                      margin: const EdgeInsets.only(
                                          top: 8.0, left: 6.0, right: 6.0),
                                      decoration: BoxDecoration(
                                          color: redAccent.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: Text(
                                        e,
                                      )))
                                  .toList(),
                            ),
                          ),
                        )
                      : Center(
                          child: Text("Your comments will appear here!"),
                        ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: const Color.fromARGB(255, 244, 244, 244),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, bottom: 10.0, right: 60.0),
                        child: SizedBox(
                          child: TextFormField(
                            controller: controller,
                            validator: (value) =>
                                value!.isEmpty ? "Required" : null,
                            decoration: InputDecoration(
                                hintText: "Enter your comment",
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 16),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16, bottom: 14.0),
                      child: IconButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              data[widget.id]!["comments"].add(controller.text);
                              controller.clear();
                              setState(() {});
                            }
                          },
                          icon: const Icon(Icons.send)),
                    ),
                  )
                ],
              ),
            )));
  }
}
