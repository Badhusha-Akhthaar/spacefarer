namespace com.badhusha.aldiproject;
using { cuid,managed } from '@sap/cds/common';


entity Spacefarer : cuid,managed {
    name: String(25);
    email: String(30);
    user_locked: Boolean;
    origin_planet: String(20);
    spacesuit_color: String(10);
    intergalactic_dept: Association to InterGalacticDepartment;
    stardusts: Composition of many Stardust on stardusts.spacefarer = $self;
    navigation_skill: Association to NavigationSkill
}

entity Stardust : cuid,managed {
    name: String(25);
    spacefarer: Association to Spacefarer;
}

entity NavigationSkill : cuid,managed {
    name: String(25);
}

entity InterGalacticDepartment : cuid {
    name: String(20);
    roles: Association to many Role on roles.department = $self
}

entity Role: cuid {
    name: String(20);
    description: String(30);
    department: Association to InterGalacticDepartment
}


@cds.persistence.skip
@readonly
entity Planet {
    id: String(20);
    name: String(20);
}