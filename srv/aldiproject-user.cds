using {com.badhusha.aldiproject as sf} from '../db/schema';

@path: '/service/aldiproject-user'
service SpacefarerServiceUser {

    entity Spacefarer @(restrict: [
        {
            grant: ['READ'],
            to   : 'authenticated-user',
            where: 'email = $user'
        }
    ]) as projection on sf.Spacefarer;

    annotate Spacefarer with @odata.draft.enabled;
    entity InterGalacticDepartment as projection on sf.InterGalacticDepartment;
    // annotate InterGalacticDepartment with @odata.draft.enabled;

    entity Role                    as projection on sf.Role;
    annotate Role with @odata.draft.enabled;
    entity NavigationSkill         as projection on sf.NavigationSkill;
    annotate NavigationSkill with @odata.draft.enabled;
    entity Stardust                as projection on sf.Stardust;
    // annotate Stardust with @odata.draft.enabled;

    entity Planet                  as projection on sf.Planet;
}
