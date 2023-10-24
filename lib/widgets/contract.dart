import 'package:email_validator/email_validator.dart';
import 'package:emailjs/emailjs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hayat_onldocc_homepage/main.dart';
import 'package:hayat_onldocc_homepage/model/string.dart';
import 'package:hayat_onldocc_homepage/widgets/footer.dart';

class Contract extends StatefulWidget {
  const Contract({super.key});

  @override
  State<Contract> createState() => _ContractState();
}

class _ContractState extends State<Contract> {
  bool _nameComplete = false;
  bool _mailFormat = false;
  bool _mailComplete = false;
  bool _contentComplete = false;
  bool _onSumbit = false;
  bool _contractAgreed = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _phoneOneController = TextEditingController();
  final TextEditingController _phoneTwoController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _nameController.addListener(() {
      setState(() {
        _nameComplete = _nameController.text.isNotEmpty;
      });
    });

    _mailController.addListener(() {
      setState(() {
        _mailComplete = _mailController.text.isNotEmpty;
        _mailFormat = EmailValidator.validate(_mailController.text);
      });
    });

    _contentController.addListener(() {
      setState(() {
        _contentComplete = _contentController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _mailController.dispose();
    _contentController.dispose();
    _phoneOneController.dispose();
    _phoneTwoController.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    setState(() {
      _onSumbit = true;
    });

    if (_nameComplete &&
        _mailComplete &&
        _mailFormat &&
        _contentComplete &&
        _contractAgreed &&
        _onSumbit) {
      Map<String, dynamic> templateParams = {
        "name": _nameController.text,
        "mail": _mailController.text,
        "phone": "010-${_phoneOneController.text}-${_phoneTwoController.text}",
        "content": _contentController.text,
      };

      try {
        await EmailJS.send(
            dotenv.env["EMAILJS_SERVICE_ID"]!,
            dotenv.env["EMAILJS_TEMPLATE_ID"]!,
            templateParams,
            Options(
              publicKey: dotenv.env["EMAILJS_PUBLIC_KEY"]!,
              privateKey: dotenv.env["EMAILJS_PRIVATE_KEY"]!,
            ));

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          showCloseIcon: true,
          content: Text(
            "계약 문의를 성공적으로 전달하였습니다.",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ));

        setState(() {
          _onSumbit = false;
        });

        _nameController.clear();
        _mailController.clear();
        _contentController.clear();
        _phoneOneController.clear();
        _phoneTwoController.clear();
      } catch (e) {
        print("send email -> $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < phoneWidth) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 20, right: 100, bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.shade100,
                          ),
                          child: SizedBox(
                            width: size.width * 0.2,
                            child: Image.asset(
                              "assets/main/contract.jpg",
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const Text(
                          "계약 문의를 진행해주세요.",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                            color: Color(0xff081C37),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "아래 내용을 남겨주시면 하야트 고객센터에서 순차적으로 연락드리겠습니다.",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 1,
                    decoration: const BoxDecoration(
                      color: Color(0xffDDE2EF),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 50, left: 30, right: 30, bottom: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "이름",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width: size.width * 0.4,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      isDense: true,
                                    ),
                                    textAlignVertical: TextAlignVertical.center,
                                    style: const TextStyle(
                                      fontSize: 10,
                                    ),
                                    controller: _nameController,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Visibility(
                              visible: _onSumbit && !_nameComplete,
                              child: const Text(
                                "→ 이름을 작성해주세요.",
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "이메일",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width: size.width * 0.4,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      isDense: true,
                                    ),
                                    style: const TextStyle(
                                      fontSize: 10,
                                    ),
                                    controller: _mailController,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Visibility(
                                  visible: _onSumbit && !_mailComplete,
                                  child: const Text(
                                    "→ 이메일을 작성해주세요.",
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: _onSumbit &&
                                      !_mailFormat &&
                                      _mailComplete,
                                  child: const Text(
                                    "→ 이메일 형식이 올바르지 않습니다.",
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "연락 받으실 연락처 (선택사항)",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: size.width * 0.4,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text(
                                    "010 -",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _phoneOneController,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]'))
                                      ],
                                      keyboardType: TextInputType.number,
                                      maxLength: 4,
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.none,
                                      textAlign: TextAlign.center,
                                      decoration: const InputDecoration(
                                        isDense: true,
                                        counterText: "",
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 10,
                                        ),
                                      ),
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "-",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _phoneTwoController,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]'))
                                      ],
                                      keyboardType: TextInputType.number,
                                      maxLength: 4,
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.none,
                                      textAlign: TextAlign.center,
                                      decoration: const InputDecoration(
                                        isDense: true,
                                        counterText: "",
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 10,
                                        ),
                                      ),
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "내용",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: size.width * 0.7,
                                  height: 200,
                                  child: TextFormField(
                                    controller: _contentController,
                                    textAlignVertical: TextAlignVertical.top,
                                    maxLines: null,
                                    minLines: null,
                                    expands: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffDDE2EF),
                                            width: 1.0),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      contentPadding: const EdgeInsets.all(20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Visibility(
                              visible: _onSumbit && !_contentComplete,
                              child: const Text(
                                "→ 내용을 작성해주세요.",
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "개인정보 수집 및 이용 동의",
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: size.width * 0.7,
                                  height: 20,
                                  child: const SingleChildScrollView(
                                    child: Text(
                                      contractRule,
                                      style: TextStyle(
                                        fontSize: 8,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Transform.scale(
                                      scale: 0.5,
                                      child: Checkbox(
                                        value: _contractAgreed,
                                        onChanged: (value) {
                                          setState(() {
                                            _contractAgreed = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    const Visibility(
                                      child: Text(
                                        "개인정보 수집 및 이용에 동의합니다.",
                                        style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Visibility(
                              visible: _onSumbit && !_contractAgreed,
                              child: const Text(
                                "→ 개인정보 수집에 동의해주세요.",
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: size.width * 0.3,
                              height: 30,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffDDE2EF),
                                  foregroundColor: const Color(0xff081C37),
                                ),
                                onPressed: _onSubmit,
                                child: const Text(
                                  "문의하기",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Footer(),
                ],
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 100, left: 100, right: 100, bottom: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.shade100,
                          ),
                          child: SizedBox(
                            width: size.width * 0.1,
                            child: Image.asset(
                              "assets/main/contract.jpg",
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const Text(
                          "계약 문의를 진행해주세요.",
                          style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w800,
                            color: Color(0xff081C37),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "아래 내용을 남겨주시면 하야트 고객센터에서 순차적으로 연락드리겠습니다.",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 1,
                    decoration: const BoxDecoration(
                      color: Color(0xffDDE2EF),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 50, left: 100, right: 100, bottom: 150),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "이름",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  width: size.width * 0.3,
                                  child: TextFormField(
                                    controller: _nameController,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Visibility(
                              visible: _onSumbit && !_nameComplete,
                              child: const Text(
                                "→ 이름을 작성해주세요.",
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "이메일",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  width: size.width * 0.3,
                                  child: TextFormField(
                                    controller: _mailController,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Visibility(
                                  visible: _onSumbit && !_mailComplete,
                                  child: const Text(
                                    "→ 이메일을 작성해주세요.",
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: _onSumbit &&
                                      !_mailFormat &&
                                      _mailComplete,
                                  child: const Text(
                                    "→ 이메일 형식이 올바르지 않습니다.",
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "연락 받으실 연락처 (선택사항)",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: size.width * 0.3,
                              child: Row(
                                children: [
                                  const Text(
                                    "010 -",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _phoneOneController,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]'))
                                      ],
                                      keyboardType: TextInputType.number,
                                      maxLength: 4,
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.none,
                                      textAlign: TextAlign.center,
                                      decoration: const InputDecoration(
                                        counterText: "",
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                      ),
                                      style: const TextStyle(fontSize: 17),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "-",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _phoneTwoController,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]'))
                                      ],
                                      keyboardType: TextInputType.number,
                                      maxLength: 4,
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.none,
                                      textAlign: TextAlign.center,
                                      decoration: const InputDecoration(
                                        counterText: "",
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                      ),
                                      style: const TextStyle(fontSize: 17),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "내용",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  width: size.width * 0.3,
                                  height: 400,
                                  child: TextFormField(
                                    controller: _contentController,
                                    textAlignVertical: TextAlignVertical.top,
                                    maxLines: null,
                                    minLines: null,
                                    expands: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xffDDE2EF),
                                            width: 1.0),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      contentPadding: const EdgeInsets.all(20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Visibility(
                              visible: _onSumbit && !_contentComplete,
                              child: const Text(
                                "→ 내용을 작성해주세요.",
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "개인정보 수집 및 이용 동의",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: size.width * 0.3,
                                  height: 100,
                                  child: const SingleChildScrollView(
                                    child: Text(
                                      contractRule,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: _contractAgreed,
                                      onChanged: (value) {
                                        setState(() {
                                          _contractAgreed = value!;
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Visibility(
                                      child: Text(
                                        "개인정보 수집 및 이용에 동의합니다.",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Visibility(
                              visible: _onSumbit && !_contractAgreed,
                              child: const Text(
                                "→ 개인정보 수집에 동의해주세요.",
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        SizedBox(
                          width: size.width * 0.3,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffDDE2EF),
                              foregroundColor: const Color(0xff081C37),
                            ),
                            onPressed: _onSubmit,
                            child: const Text(
                              "문의하기",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Footer(),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
