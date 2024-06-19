sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/badhusha/aldiprojectui/test/integration/FirstJourney',
		'com/badhusha/aldiprojectui/test/integration/pages/SpacefarerList',
		'com/badhusha/aldiprojectui/test/integration/pages/SpacefarerObjectPage',
		'com/badhusha/aldiprojectui/test/integration/pages/StardustObjectPage'
    ],
    function(JourneyRunner, opaJourney, SpacefarerList, SpacefarerObjectPage, StardustObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/badhusha/aldiprojectui') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheSpacefarerList: SpacefarerList,
					onTheSpacefarerObjectPage: SpacefarerObjectPage,
					onTheStardustObjectPage: StardustObjectPage
                }
            },
            opaJourney.run
        );
    }
);