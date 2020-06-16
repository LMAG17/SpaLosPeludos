import React, { Component } from 'react';
import { Row, Col, Button } from 'reactstrap';

import logo from './assets/img/logofinal.png';
import perro from './assets/img/dog.png';
class Banner extends Component {
    render() {
        return (
            <div>
                <Row className="p-0 m-0 w-100" >
                    <Col xs="12" sm="6" md="6" >
                        <Row>
                            <img src={logo} alt="Spa Los Peludos"></img>
                        </Row>
                        <Row className="mb-2">
                            <div className="d-flex flex-column align-items-end justify-content-end w-50 w-sm-100">
                                <p className="" id="texto-bienvenida">
                                    Bienvenidos al universo de Spa los Peludos, tu visita es un gusto para nosotros
                            </p>
                                <Button color="primary" className="mr-5" >  Agendar Ahora  </Button>
                            </div>
                        </Row>
                    </Col>
                    <Col className="d-none d-md-inline" md="6">
                        <img src={perro} alt="Guau Guau"></img>
                    </Col>
                </Row>
            </div>
        )
    }
}

export default Banner;