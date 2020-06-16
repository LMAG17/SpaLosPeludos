import React, { Component } from 'react';
import { Row, Col, Container, Card } from 'reactstrap';
class Banner extends Component {
    render() {
        return (
            <div id="about">
                <Container fluid="true" className="pt-5 pb-5 w-75">
                    .<div class="container-fluid text-center">
                    </div>
                    <Row className="p-0 m-0 w-100" >
                        <Col xs="12" sm="12" md="6">
                            <Card className="">
                                <img src="https://www.hogarmania.com/archivos/201708/spa-perro-1280x720x80xX.jpg" alt="Spa Los Peludos" className="rounded"></img>
                            </Card>
                        </Col>
                        <Col xs="12" sm="12" md="6" className="d-flex align-items-start">
                            <div>
                                <h3 className="display-4">Acerca de nosotros</h3>
                                <p>Somos un equipo de personas amantes de los animales, tomamos la desicion de abrir al publico un espacio unico de relajacion para nuestros hijitos de cuatro patas, un lugar creado con la intencion de darles el lugar que se merecen rodeados de amor y buen trato, con un equipo de profesionales enfocados a realizar un exelente trabajo para tu satisfaccion y la de tu peludito </p>
                            </div>
                        </Col>
                    </Row>
                </Container>
            </div>
        )
    }
}

export default Banner;