import React, { Component } from 'react'
import { Container, Card, Row, Col } from 'reactstrap'
import spaIcon from './assets/img/spa icon.png';
import masaje from './assets/img/masajeperruno.jpg';
class Services extends Component {
    render() {
        return (
            <div clasName="p-auto" id="servicios">
                <Container className="text-center p-auto m-auto" id="servicios-titulo">
                    <h1  clasName="animated bounce infinite">Servicios</h1>
                    <h3>Te ofrecemos los mejores cuidados para tu peludito</h3>
                    <Card id="service-card">
                        <Row>
                            <Col>
                                <img src={spaIcon} alt="Spa completo"></img>
                            </Col>
                            <Col>
                                <h1 id="spa-info">Spa completo</h1>

                            </Col>
                        </Row>
                    </Card>
                </Container>
            </div>
        )
    }
}

export default Services
