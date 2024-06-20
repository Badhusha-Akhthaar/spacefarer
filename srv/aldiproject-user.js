const cds = require("@sap/cds");
const nodemailer = require("nodemailer");

module.exports = cds.service.impl(async function (srv) {
    const { Spacefarer, Stardust, InterGalacticDepartment, Planet } = this.entities;

    srv.on('READ', Spacefarer, async (req) => {
        console.log(req.user.id)
        let query = {SELECT:{
            from: {ref:["com.badhusha.aldiproject.Spacefarer"]},
            columns: [
              {ref:["name"]},
              {ref:["email"]},
              {ref:["user_locked"]},
              {ref:["origin_planet"]},
              {ref:["spacesuit_color"]}
            ],
            where: [{ref:["email"]}, "=", {val: req.user.id}]
          }}
          const result = await cds.run(query)
          return result;


        // let query = SELECT.from(`com.badhusha.aldiproject.Spacefarer as B`)
        //     .join(`com.badhusha.aldiproject.InterGalacticDepartment as A`)
        //     .on('B.ID', '=', 'A.sf_ID').where('B.email', '=', req.user.id)

        // const result = await cds.run(query)
        // return result;
    })

    srv.on('READ', Planet, async (req) => {
        let result = [
            {
                id: 'EARTH',
                name: 'Earth'
            },
            {
                id: 'MARS',
                name: 'Mars'
            },
            {
                id: 'GJ_463_B',
                name: 'GJ-463-b'
            },
            {
                id: 'K2-405_B',
                name: 'K2-405-b'
            },
            {
                id: 'KEPLER-1656',
                name: 'Kepler-1656'
            },
            {
                id: 'GAIA20EAE_B',
                name: 'Gaia20eae-b'
            }
        ]
        let query = req.query.SELECT.where;
        if (query && query.length !== 0) {
            let q = query[2].val;
            return result.filter(r => r.id !== q);
        }
        else {
            return result
        }

    })
});