import React, { Component } from 'react';
import { Row, Col, Button } from 'reactstrap';

import logo from './assets/img/logofinal.png';
import perro from './assets/img/dog.png';
class Banner extends Component {
    render() {
        return (
            <div>
                <Row xs="2" className="p-0 m-0 w-100" >
                    <Col md="7">
                        <img src={logo} alt="Spa Los Peludos"></img>
                        <div className="d-flex flex-column align-items-end justify-content-end w-50">
                            <p className="" id="texto-bienvenida">
                                Bienvenidos al universo de Spa los Peludos, tu visita es un gusto para nosotros
                            </p>
                            <Button color="primary" className="m5" >  Agendar Ahora  </Button>
                        </div>
                    </Col>
                    <Col md="5">
                        <img src={perro} alt="Guau Guau"></img>
                    </Col>
                </Row>
            </div>
        )
    }
}

export default Banner;