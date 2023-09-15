import 'package:flutter/material.dart';
import 'package:mychatproject/data%20models/providerclass.dart';
import 'package:mychatproject/data%20models/usermodel.dart';
import 'package:mychatproject/main.dart';
import 'package:mychatproject/widgets/list_tile_homescreen.dart';
import 'package:provider/provider.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    final userData = context.watch<ProviderClass>().searchList;
    return Positioned(
      top: mq.height * 0.12,
      left: mq.width * 0.005,
      width: mq.width * 0.99,
      height: mq.height * 0.08,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: GestureDetector(
          onTap:() => showSearch(
            context: context,
            delegate: CustomSearchDelegate(userData: userData),
            ),
          child: Container(
            color: Colors.grey.shade200,
            
            child: Row(
              children: [
                SizedBox(width: mq.width * 0.1,child: const Icon(Icons.search)),
                SizedBox(width: mq.width * 0.02,),
                SizedBox(width: mq.width * 0.4,child: const Text("Tap to Search"))
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }
}
  class CustomSearchDelegate extends SearchDelegate {

      final List<UserModel> userData; 
      CustomSearchDelegate({required this.userData});
    @override
    List<Widget> buildActions(BuildContext context) {
      // Actions to display in the search bar (e.g., clear query button)
      return [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = ''; // Clear the search query
          },
        ),
      ];
    }

    @override
    Widget buildLeading(BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, ''); // Close the search interface
        },
      );
    }

    @override
    Widget buildResults(BuildContext context) {
        var searchlist = userData.where((user) => 
                  user.name.toLowerCase().contains(query.toLowerCase()) ||
                  user.email.toLowerCase().contains(query.toLowerCase())).toList();
          return ListView.builder(
            itemCount: searchlist.length,
            itemBuilder:(context, index) => UsersListTile(user: searchlist[index]),
          );
    }

    @override 
    Widget buildSuggestions(BuildContext context) {
      var suggestionList = userData.where((user) =>
            user.name.toLowerCase().contains(query.toLowerCase()) ||
            user.email.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => UsersListTile(user: suggestionList[index]));
    }
  }
