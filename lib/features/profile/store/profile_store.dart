import 'package:mobx/mobx.dart';
import '../model/catergory_model.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  @observable
  ObservableList<CategoryModel> categoryList = ObservableList<CategoryModel>();

  @observable
  String category = '';

  @observable
  bool isEditMode = false;

  @observable
  ObservableList<bool> selectedSubjects =
      ObservableList<bool>.of([false, false, false, false]);

  @action
  void toggleEditMode() {
    isEditMode = !isEditMode;
  }

  @action
  void setSubjectSelected(bool value, int index) {
    selectedSubjects[index] = value;
  }

  @action
  void addCatergories(String category) {
    if (category != '') {
      categoryList.add(CategoryModel(category: category));
    }
  }

  @action
  void editCategory(CategoryModel oldCategory, String newCategory) {
    final index = categoryList.indexOf(oldCategory);
    if (index != -1) {
      categoryList[index] = CategoryModel(category: newCategory);
    }
  }

  @action
  void deleteCategory(CategoryModel category) {
    categoryList.remove(category);
  }

  // Currency List page store
  @observable
  int selectedCurrencyIndex = 0;

  @action
  void setSelectedCurrency(int index) {
    selectedCurrencyIndex = index;
  }

  // Survey Form
  @observable
  int selectedAnsQuestion1 = 0;

  @action
  void setQuestion1Ans(int index) {
    selectedAnsQuestion1 = index;
  }

  @observable
  int selectedAnsQuestion2 = 0;

  @action
  void setQuestion2Ans(int index) {
    selectedAnsQuestion2 = index;
  }

  @observable
  int selectedAnsQuestion3 = 0;

  @action
  void setQuestion3Ans(int index) {
    selectedAnsQuestion3 = index;
  }

  @observable
  int selectedAnsQuestion4 = 0;

  @action
  void setQuestion4Ans(int index) {
    selectedAnsQuestion4 = index;
  }
}
