import React, { Component } from 'react'
import { Row, Col } from 'reactstrap'
import logo from './assets/img/logofinal.png';
export default class Footer extends Component {
    render() {
        return (
            <div className="footer" id="footer">
                <Row className="p-0 m-0 w-100">
                    <Col xs="4" className="m-auto">
                        <img src={logo} alt="Spa Los Peludos" className="pt-4"></img>
                        <div className="d-flex flex-column align-items-end justify-content-end w-100">
                            <p id="texto-despedida">
                                Amamos y cuidamos a tus peluditos
                        </p>
                        </div>
                    </Col>
                    <Col>
                        <ul>
                            <li>
                                <a href="#home">
                                    Home
                                </a>
                            </li>
                            <li>
                                <a href="#about">
                                    Acerca de nosotros
                                </a>
                            </li>
                            <li>
                                <a href="#services">
                                    Servicios
                                </a>
                            </li>
                            <li>
                                <a href="#contact">
                                    Contacta
                                </a>
                            </li>
                            <li>
                                <a href="#moments">
                                    Mejores momentos
                                </a>
                            </li>
                            <li>
                                <a href="#footer">
                                    Encuentranos
                                </a>
                            </li>
                        </ul>
                    </Col>
                    <Col>
                        <ul>
                            <li className="titulo-footer">
                                Direccion:
                            </li>
                            <li>
                                Calle 39 sur # 72 L 07 Carimagua
                            </li>
                            <li className="titulo-footer">
                                Telefono
                            </li>
                            <li>
                                +57 300-829-9928
                            </li>
                            <li className="titulo-footer">
                                Correo electrónico
                            </li>
                            <li>
                                contacto@spalospeludos.com
                            </li>
                        </ul>
                    </Col>
                    <Col>
                        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15907.635831345407!2d-74.14525629999999!3d4.61031540000006!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x4894c51d2e9729e8!2sSpa%20los%20Peludos!5e0!3m2!1ses!2sco!4v1587413095438!5m2!1ses!2sco" frameborder="0" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                    </Col>
                </Row>
                <div className="p-8 text-center md-col-12" id="marca">
                    <hr></hr>
                    <h6>2020 © Spa Los Peludos 🐕 </h6>
                </div>
            </div>
        )
    }
}
