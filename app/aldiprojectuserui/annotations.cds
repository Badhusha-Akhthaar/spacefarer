using SpacefarerServiceUser as service from '../../srv/aldiproject-user';
annotate service.Spacefarer with @(
    UI.FieldGroup #GeneratedGroup : {
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
                Value : user_locked,
            },
            {
                $Type : 'UI.DataField',
                Value : origin_planet,
            },
            {
                $Type : 'UI.DataField',
                Value : spacesuit_color,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ]
);

annotate service.Spacefarer with {
    navigation_skill @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'NavigationSkill',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : navigation_skill_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
        ],
    }
};

annotate service.Spacefarer with {
    name @Common.FieldControl : #ReadOnly
};
annotate service.Spacefarer with {
    email @Common.FieldControl : #ReadOnly
};
annotate service.Spacefarer with {
    user_locked @Common.FieldControl : #ReadOnly
};
annotate service.Spacefarer with {
    origin_planet @Common.FieldControl : #ReadOnly
};
annotate service.Spacefarer with {
    spacesuit_color @Common.FieldControl : #ReadOnly
};
