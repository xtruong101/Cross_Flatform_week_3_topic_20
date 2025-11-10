// Action: Cập nhật trạng thái mới
class UpdateStateAction {
  final int value;
  UpdateStateAction(this.value);
}

// Action: Quay về một trạng thái trong lịch sử
class TravelToStateAction {
  final int index;
  TravelToStateAction(this.index);
}