sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/badhusha/aldiprojectuserui/test/integration/FirstJourney',
		'com/badhusha/aldiprojectuserui/test/integration/pages/SpacefarerObjectPage'
    ],
    function(JourneyRunner, opaJourney, SpacefarerObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/badhusha/aldiprojectuserui') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheSpacefarerObjectPage: SpacefarerObjectPage
                }
            },
            opaJourney.run
        );
    }
);