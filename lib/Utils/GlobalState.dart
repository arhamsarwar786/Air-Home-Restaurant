import 'package:air_home_retaurant/ModelClasses/BloglistModel.dart';
import 'package:air_home_retaurant/ModelClasses/CategoryPostsModel.dart';
import 'package:air_home_retaurant/ModelClasses/FavoriteModel.dart';
import 'package:air_home_retaurant/ModelClasses/FbUser.dart';
import 'package:air_home_retaurant/ModelClasses/MatchListResponseModel.dart';
import 'package:air_home_retaurant/ModelClasses/Message.dart';
import 'package:air_home_retaurant/ModelClasses/MessageRooms.dart';
import 'package:air_home_retaurant/ModelClasses/PostCategories.dart';
import 'package:air_home_retaurant/ModelClasses/ReservationsModel.dart';
import 'package:air_home_retaurant/ModelClasses/ReviewModal.dart';
import 'package:air_home_retaurant/ModelClasses/User.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GlobalState {
  static final GlobalState _singleton = GlobalState._internal();

  factory GlobalState() {
    return _singleton;
  }

  GlobalState._internal();

  /// Favorites List of All POSTS
  static CategoryPostsModel corsiDiCusinaFavorites;
  static CategoryPostsModel homeRestaurantFavorites;
  static CategoryPostsModel chefDomicilioFavorites;
  static CategoryPostsModel tourGastronomiciFavorites;

  /// SAVED FAVORITES MODAL

  //// POSTS OF CATEGORIES
  static CategoryPostsModel corsiDiCusinaPosts;
  static CategoryPostsModel homeRestaurantPosts;
  static CategoryPostsModel chefDomicilioPosts;
  static CategoryPostsModel tourGastronomiciPosts;

  static MyUser currentUser;
  static FbUser fbUser;

  static User firebaseUser;
  static GoogleSignIn googleSignIn;

  static int userId;
  static PostCategories categoriesPosts;
  static CategoryPostsModel postsList;
  static dynamic allPostData;

  /// for Delete

  ///  Used To Handle the Data in Posts
  // static CategoryPostsModel corsiPostsList;
  // static CategoryPostsModel corsiOnlinePostsList;
  // static CategoryPostsModel chefPostsList;
  // static CategoryPostsModel eRestaurantPostsList;
  // static CategoryPostsModel tourPostsList;

  static ReservationsModel reservationsModel;
  static BloglistModel bloglistModel;
  static MatchListResponseModel matchListResponseModel;

  static FavoriteModel myFavorites;
  static ReviewModal myReview;
  static List allergies = [];

  static List<Message> messageChatList;
  static List<MessageRooms> messageChatRoomsList = null;
  static int currentSelectedMessageRoom = 0;
  List<Message> messageChatListForSelectedRoom = null;

  ///Firebase SIgnIn in with Email/Password
  static Uri deeplink;
}
