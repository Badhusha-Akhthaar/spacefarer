const cds = require("@sap/cds");

module.exports = cds.service.impl(async function (srv) {
    const { Spacefarer,Stardust, Planet } = this.entities;

    // srv.before('CREATE', Attachments, async (req) => {
    //     console.log("Creating File");
    //     req.data.url = `/service/incidents/Attachments(${req.data.ID})/data`
    // })
    // srv.before('CREATE', Incidents, async (req) => {
    //     console.log(req)
    //     req.data.number = Math.random().toString().slice(2, 12);
    //     req.data.status = "New Incident"
    // })


    // srv.after('READ', Incidents, (data) => {
    //     const incidents = Array.isArray(data) ? data : [data];

    //     incidents.forEach((incident) => {
    //         switch (incident.status) {
    //             case "New Incident":
    //                 incident.status_criticality = "Success"
    //                 break;
    //             case "In Progress":
    //                 incident.status_criticality = "Warning"
    //                 break;
    //             case "Claim Created":
    //                 incident.status_criticality = "Indication02"
    //                 break;
    //             case "Closed":
    //                 incident.status_criticality = "Indication08"
    //                 break;
    //             default:
    //                 incident.status_criticality = "None"
    //                 break;
    //         }
    //     })

    // })

    srv.on('CREATE',Stardust,async (req,next)=>{
        console.log("*********************CREATE************")
        return next();
    });
    srv.on('NEW',Stardust,async (req,next)=>{
        console.log("*********************NEW************")
        return next();
    });


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