using { com.badhusha.aldiproject as sf } from '../db/schema';

annotate sf.Spacefarer with {
    // ID @UI.Hidden;
    email @title : 'Email';
    name @title : 'Name';
    origin_planet @title : 'Origin Planet';
    spacesuit_color @title : 'Space-Suit Color';
    user_locked @title : 'User Locked'
};

annotate sf.Stardust with {
    ID @UI.Hidden;
    name @title : 'Stardust Name';
};

