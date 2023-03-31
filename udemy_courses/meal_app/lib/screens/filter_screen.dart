import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  final Map<String, bool> filters;
  final Function saveFilters;
  static const routeName = '/filters';

  const FilterScreen(
      {Key? key, required this.saveFilters, required this.filters})
      : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.filters['gluten']!;
    _vegetarian = widget.filters['vegetarian']!;
    _vegan = widget.filters['vegan']!;
    _lactoseFree = widget.filters['lactose']!;
    super.initState();
  }

  void _showToast(BuildContext context) {
    final snackBar = SnackBar(content: Text('Saved'));
    ScaffoldMessenger.of(context).showSnackBar;
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    void Function(bool) updateValue,
  ) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
                _showToast(context);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                  'Gluten-free', 'Only include gluten-free meals.', _glutenFree,
                  (bool newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              _buildSwitchListTile(
                  'Lactose-free',
                  'Only include lactose-free meals.',
                  _lactoseFree, (bool newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
              _buildSwitchListTile(
                  'Vegetarian', 'Only include vegetarian meals.', _vegetarian,
                  (bool newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
              _buildSwitchListTile('Vegan', 'Only include Vegan meals.', _vegan,
                  (bool newValue) {
                setState(() {
                  _vegan = newValue;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
