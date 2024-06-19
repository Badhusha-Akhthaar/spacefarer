using SpacefarerService as service from '../../srv/aldiproject-service';

annotate service.Spacefarer with @(
    Capabilities.Insertable: true,
    Capabilities.Deletable: true
);

annotate service.InterGalacticDepartment with @(
    Capabilities.Insertable: true,
    Capabilities.Deletable: true,
    Capabilities.Updatable: false
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


annotate service.NavigationSkill with @(
    UI.HeaderInfo : {
        TypeName      : 'Navigation Skill',
        TypeNamePlural: 'Navigation Skills',
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
            Label : 'Intergalactic Departments',
            ID : 'IntergalacticDepartments',
            Target : 'intergalactic_dept_roles/@UI.LineItem#IntergalacticDepartments',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Stardusts',
            ID : 'Stardusts',
            Target : 'stardusts/@UI.LineItem#Stardusts',
        }
    ]
);

annotate service.Spacefarer with @(
    UI.FieldGroup #AdditionalInfo : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : navigation_skill.name,
                Label : 'name',
            },],
    }
);
annotate service.Spacefarer with @(
    UI.FieldGroup #AdditionalInfo1 : {
        $Type : 'UI.FieldGroupType',
        Data : [],
    }
);
annotate service.InterGalacticDepartment with @(
    UI.LineItem #IntergalacticDepartments : [
        {
            $Type : 'UI.DataField',
            Value : role,
            Label : 'Role',
        },{
            $Type : 'UI.DataField',
            Value : department_name,
            Label : 'Department Name',
        },]
);
annotate service.Stardust with @(
    UI.LineItem #Stardusts : [
        {
            $Type : 'UI.DataField',
            Value : name,
        },]
);
// annotate service.Stardust with @(
//     UI.LineItem #Stardusts : [
//         {
//             $Type : 'UI.DataField',
//             Value : name,
//         },]
// );
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

