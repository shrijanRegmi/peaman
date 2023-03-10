enum PeamanChatRequestStatus {
  idle,
  accepted,
  declined,
}

const ksPeamanChatRequestStatus = <PeamanChatRequestStatus, String>{
  PeamanChatRequestStatus.idle: "idle",
  PeamanChatRequestStatus.accepted: "accepted",
  PeamanChatRequestStatus.declined: "declined",
};
