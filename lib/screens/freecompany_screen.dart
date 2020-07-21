import 'package:xiv/controllers/freecompany_interface.dart';

class FreeCompanyScreen extends StatefulWidget {
  @override
  _FreeCompanyScreenState createState() => _FreeCompanyScreenState();
}

class _FreeCompanyScreenState extends State<FreeCompanyScreen> {
  @override
  Widget build(BuildContext context) {
    final xivModel = Provider.of<XIV>(context);

    ResponsiveWidgets.init(
      context,
      height: 1920, // Optional
      width: 1080, // Optional
      allowFontScaling: true, // Optional
    );

    return ResponsiveWidgets.builder(
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
//                  title: Container(
//                    margin: EdgeInsets.only(top: 30),
//                    child: Text('${xivModel.getName}'),
//                  ),
                  expandedHeight: 100,
                  floating: true,
                  backgroundColor: Colors.transparent,
                  flexibleSpace: FlexibleSpaceBar(
                    background: ContainerResponsive(
                      padding: EdgeInsets.only(bottom: 5),
                      alignment: Alignment.center,
                      child: ClipOval(
                        child: Stack(
                          children: <Widget>[
                            Image.network(
                              '${xivModel.getFreeCompanyCrest[0]}',
                              fit: BoxFit.fill,
                            ),
                            Image.network(
                              '${xivModel.getFreeCompanyCrest[1]}',
                              fit: BoxFit.fill,
                            ),
                            Image.network(
                              '${xivModel.getFreeCompanyCrest[2]}',
                              fit: BoxFit.fill,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList(
//                  itemExtent: 100,
                  delegate: SliverChildListDelegate(
                    [
                      CContainer(
                          body: '${xivModel.getFreeCompanyName}',
                          sub:
                              'Allied to The ${xivModel.getFreeCompanyGrandCompany}',
                          icon: FFFonts.SymbolMoogle),
                      CContainer(
                          body:
                              '[${xivModel.getFreeCompanyTag}] Rank: ${xivModel.getFreeCompanyRank}',
                          sub: '"${xivModel.getFreeCompanySlogan}"',
                          icon: FFFonts.ItemCategory_Chairs_and_Beds),
                      CContainer(
                          body: 'FC Status',
                          sub: 'Active: ${xivModel.getFreeCompanyActive}',
                          icon: FFFonts.app_drawer_news),
                      CContainer(
                          body:
                              '${xivModel.getFreeCompanyActiveMemberCount} Active members',
                          sub: 'FC ID: ${xivModel.getFreeCompanyId}',
                          icon: FFFonts.app_status_online),
                      CContainer(
                          body: '${xivModel.getFreeCompanyEstateName}',
                          sub:
                              '${xivModel.getFreeCompanyPlot}\n\n-${xivModel.getFreeCompanyGreeting}',
                          icon: FFFonts.app_world_home),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
