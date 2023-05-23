class ChatDetails{
  String msg;
  bool isSendByMe;

  ChatDetails(this.msg, this.isSendByMe);
}

List<ChatDetails> myChats = [
  ChatDetails("When will you be here?", false),
  ChatDetails("On my way! Mate", true),
  ChatDetails("Just Waiting for you!!!!", false),
  ChatDetails("Just few minutes!", true),
  ChatDetails('Bro have you listen to "Until I Found You" song? ', false),
  ChatDetails("Yes, its my favorite!!", true),
];