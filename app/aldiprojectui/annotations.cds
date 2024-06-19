using SpacefarerService as service from '../../srv/aldiproject-service';

annotate service.Spacefarer with @(
    Capabilities.Insertable: true,
    Capabilities.Deletable: true
);

annotate service.Stardust with @(
    Capabilities.Insertable: true,
    Capabilities.Deletable: true
);

annotate service.NavigationSkill with @(
    Capabilities.Insertable: true,
    Capabilities.Deletable: true
);


annotate service.Spacefarer with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : name
        },
        {
            $Type : 'UI.DataField',
            Value : email
        },
        {
            $Type : 'UI.DataField',
            Value : origin_planet,
        },
        {
            $Type : 'UI.DataField',
            Value : spacesuit_color
        },
        {
            $Type : 'UI.DataField',
            Value : createdBy
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt
        },

    ]
);

annotate service.Stardust with @(UI.LineItem #Stardust: [
    {
        $Type            : 'UI.DataField',
        Value            : name,
        ![@UI.Importance]: #High,
    }
]);

annotate service.Stardust with @(
    UI.HeaderInfo : {
        TypeName      : 'Stardust',
        TypeNamePlural: 'Startdusts',
        Title         : {
            $Type: 'UI.DataField',
            Value: ID
        },
        Description : {
            $Type : 'UI.DataField',
            Value: name
        }
    }
);




annotate service.Spacefarer with @(
    UI.HeaderInfo : {
        TypeName      : 'Space Farer',
        TypeNamePlural: 'Space Farers',
        Title         : {
            $Type: 'UI.DataField',
            Value: ID
        }

    },
    UI.SelectionFields     : [
        name,
        email,
        origin_planet,
        spacesuit_color,
        user_locked
    ],
    UI.FieldGroup #General : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Value : origin_planet,
            },
            {
                $Type : 'UI.DataField',
                Value : spacesuit_color,
            },
            {
                $Type : 'UI.DataField',
                Value : user_locked,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneralFacet',
            Label : 'General',
            Target : '@UI.FieldGroup#General',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'StardustFacet',
            Label : 'Stardusts',
            Target : 'stardusts/@UI.LineItem#Stardust',
        }
    ]
);

// annotate service.Spacefarer with @(
//     UI.FieldGroup #GeneratedGroup : {
//         $Type : 'UI.FieldGroupType',
//         Data : [
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'Name',
//                 Value : name,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'E-Mail',
//                 Value : email,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'User Locked',
//                 Value : user_locked,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'Origin Planet',
//                 Value : origin_planet,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'Space-Suit Color',
//                 Value : spacesuit_color,
//             },
//         ],
//     },
//     UI.Facets : [
//         {
//             $Type : 'UI.ReferenceFacet',
//             ID : 'GeneratedFacet1',
//             Label : 'General Information',
//             Target : '@UI.FieldGroup#GeneratedGroup',
//         },
//     ],
//     UI.LineItem : [
//         {
//             $Type : 'UI.DataField',
//             Label : 'Name',
//             Value : name,
//         },
//         {
//             $Type : 'UI.DataField',
//             Label : 'E-Mail',
//             Value : email,
//         },
//         {
//             $Type : 'UI.DataField',
//             Label : 'User Locked',
//             Value : user_locker,
//         },
//         {
//             $Type : 'UI.DataField',
//             Label : 'Origin Planet',
//             Value : origin_planet,
//         },
//         {
//             $Type : 'UI.DataField',
//             Label : 'Space-Suit Color',
//             Value : spacesuit_color,
//         },
//     ],
// );

// annotate service.Spacefarer with {
//     intergalactic_dept @Common.ValueList : {
//         $Type : 'Common.ValueListType',
//         CollectionPath : 'InterGalacticDepartment',
//         Parameters : [
//             {
//                 $Type : 'Common.ValueListParameterInOut',
//                 LocalDataProperty : intergalactic_dept_ID,
//                 ValueListProperty : 'ID',
//             },
//             {
//                 $Type : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'name',
//             },
//         ],
//     }
// };

// annotate service.Spacefarer with {
//     navigation_skill @Common.ValueList : {
//         $Type : 'Common.ValueListType',
//         CollectionPath : 'NavigationSkill',
//         Parameters : [
//             {
//                 $Type : 'Common.ValueListParameterInOut',
//                 LocalDataProperty : navigation_skill_ID,
//                 ValueListProperty : 'ID',
//             },
//             {
//                 $Type : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'name',
//             },
//         ],
//     }
// };

