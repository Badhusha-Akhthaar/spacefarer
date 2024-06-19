const cds = require("@sap/cds");
const nodemailer = require("nodemailer");

module.exports = cds.service.impl(async function (srv) {
    const { Spacefarer, Stardust, InterGalacticDepartment, Planet } = this.entities;

    srv.before('UPDATE', Spacefarer, async (req) => {
        if (req.data.intergalactic_dept_roles) {
            for (let i = 0; i < req.data.intergalactic_dept_roles.length; i++) {
                req.data.intergalactic_dept_roles[i].department_name = `DEPT-${req.data.intergalactic_dept_roles[i].department_name}`;
                req.data.intergalactic_dept_roles[i].role = `ROLE-${req.data.intergalactic_dept_roles[i].role}`
            }
        }
    })
    srv.before('CREATE', Spacefarer, async (req) => {
        if (req.data.intergalactic_dept_roles) {
            for (let i = 0; i < req.data.intergalactic_dept_roles.length; i++) {
                if(req.data.intergalactic_dept_roles[i].department_name.startsWith("DEPT-") || req.data.intergalactic_dept_roles[i].role.startsWith("ROLE-")){
                    throw Error("Department name & Role should not start with DEPT or ROLE respectively");
                }
                req.data.intergalactic_dept_roles[i].department_name = `DEPT-${req.data.intergalactic_dept_roles[i].department_name}`;
                req.data.intergalactic_dept_roles[i].role = `ROLE-${req.data.intergalactic_dept_roles[i].role}`
            }
        }

    })

    srv.after('CREATE',Spacefarer, async (result)=>{
        let { email } = result
        console.log(email)
        const transporter = nodemailer.createTransport({
            host: 'smtp.ethereal.email',
            port: 587,
            auth: {
                user: 'christine.jacobi71@ethereal.email',
                pass: 'YQN9HXYsBYWq6JSx4E'
            }
        });

        const info = await transporter.sendMail({
            from: '"Maddison Foo Koch 👻" <maddison53@ethereal.email>', // sender address
            to: "akhthaaralibadhusha@gmail.com", // list of receivers
            subject: "Hello ✔", // Subject line
            text: "Hello world?", // plain text body
            html: "<b>Hello world?</b>", // html body
          });
        
        console.log("Message sent: %s", info.messageId);
    })
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

    srv.on('CREATE', Stardust, async (req, next) => {
        console.log("*********************CREATE************")
        return next();
    });
    srv.on('NEW', Stardust, async (req, next) => {
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